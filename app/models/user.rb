class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username, :is_admin, :approved
  
  attr_accessor :is_admin, :check_admin, :approved
  
  #after_save :send_notification_emails
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  
  def check_admin
    if is_admin ? 'Yes' : 'No'
  end
  
  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
  
  def send_notification_emails
    #Notifies both admin and user of the registration
    UserMailer.confirmation(self).deliver
    UserMailer.new_user(self).deliver
  end

end
end
