# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :treatments
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :treatment_ids, :current_password
  attr_accessible :username, :activate_user
  attr_accessible :name, :address, :phone, :postal, :is_admin, :is_approved, :user_message
  
  #These attributes are not mapped to the users database table 
  attr_accessor :user_message #used to keep the message from the user on registration and handed to the mailer
  
  after_create :send_admin_notification_email
  #after_activate :send_user_notification_email
  
  validates_confirmation_of :password, :on => :create
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  # this will activate a user
  def activate_user
    self.save
    self.send_user_notification_email
  end
  
  #Has the user been activated by admin ?
  def active_for_authentication? 
    super && is_approved? 
  end 
  
  #If hes not approved then let him know 
  def inactive_message 
    if !is_approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
   # edit user profile without needing a password & password confirmation
  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end
  
#  def password_required?
#    (authentications.empty? || !password.blank?) && super
#  end
 
  
  def send_admin_notification_email
    #Notifies admin of the registration
    UserMailer.new_user(self).deliver
  end
  
  def send_user_notification_email
    #Notifies user of beaing approved
    UserMailer.confirmation(self).deliver
  end


end
