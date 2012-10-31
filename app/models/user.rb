class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :treatments
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username, :is_admin, :approved, :activate_user 
  attr_accessible :name, :address, :phone, :postal
  
  attr_accessor :is_admin, :check_admin, :approved, :activate_user
  
  #after_save :send_notification_emails
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  # this will activate a user
  def activate_user
    self.update_attributes(params[:approved])
  end
  
  def check_admin
    if is_admin ? 'Yes' : 'No'
    end
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
  
   # edit user profile without needing a password & password confirmation
  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
  
  def send_notification_emails
    #Notifies both admin and user of the registration
    UserMailer.confirmation(self).deliver
    UserMailer.new_user(self).deliver
  end


end
