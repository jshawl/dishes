class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :emptyings
  has_many :created_notifications, :class_name => "Notification", :foreign_key => "created_by"
  has_many :received_notifications, :class_name => "Notification", :foreign_key => "sent_to"
end
