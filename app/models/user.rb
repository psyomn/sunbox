class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bio, :email, :name

  # Validations
  validates :email, :presence => true
  validates :name, :presence => true, :uniqueness => true

  # Relations 
  has_many :sent_messages, :class_name => "Message", :foreign_key => "from_user_id" 
  has_many :received_messages, :class_name => "Message", :foreign_key => "to_user_id"

end
