class User < ActiveRecord::Base
  attr_accessible :email, :fullname, :password, :password_confirmation, :remember_token, :username
  has_secure_password  
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates :username, :length => { :maximum => 10, :minimum=>6 }
  validates :username, :length => { :maximum => 10, :minimum=>6 }
  validates :password, :length => { :maximum => 10, :minimum=>6 }
  validates(:password_confirmation, presence: true)
  validates_confirmation_of :password
  validates(:fullname, presence: true) 
  validates(:email, presence: true)
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  before_save{ |user| user.username = username.downcase }
  before_save { |user| user.email = email.downcase }
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
end
