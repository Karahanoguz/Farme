class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def start_chat
    @user = User.find(params[:user])
    sender_chatrooms = Chatroom.where(sender: @user, receiver: current_user)
    receiver_chatrooms = Chatroom.where(sender: current_user, receiver: @user)
    if sender_chatrooms.empty? && receiver_chatrooms.empty?
      @chatroom = Chatroom.create(sender: @user, receiver: current_user)
    else
      @chatroom = sender_chatrooms.first unless sender_chatrooms.empty?
      @chatroom = receiver_chatrooms.first unless receiver_chatrooms.empty?
    end
    redirect_to chatroom_path(@chatroom)
  end
end
