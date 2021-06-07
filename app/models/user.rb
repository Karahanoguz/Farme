class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :orders
  has_many :chatrooms_as_sender, :class_name => 'Chatroom', :foreign_key => 'sender_id'
  has_many :chatrooms_as_receiver, :class_name => 'Chatroom', :foreign_key => 'receiver_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
