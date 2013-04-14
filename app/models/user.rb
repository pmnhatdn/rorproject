class User < ActiveRecord::Base
  attr_accessible :username, :email, :fullname, :password, :password_confirmation, :remember_token
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
  has_many :entries, dependent: :destroy
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
  before_save:create_remember_token    
  #def self.check(username,password) 
	#user =find_by_username(username)
	#if user && user.password==password
	#	user
	#else
	#	nil
	#end
  #end 
  def feed
  	Entry.where("user_id =?",id)
  end    
  private
  def create_remember_token
      if(self.remember_token==nil)
  	     self.remember_token = SecureRandom.urlsafe_base64
      end
  end  

end
