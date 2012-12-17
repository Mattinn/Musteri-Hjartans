# encoding: utf-8
class UserMailer < Devise::Mailer
  default from: "musterihjartans@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
  def new_user(user)
    @name = user.name
    @phone = user.phone
    @address = user.address
    @postal = user.postal
    @message = user.user_message
    mail to: "musterihjartans@gmail.com", subject: 'Nýr meðferðaraðili'
    
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmation.subject
  #
  def confirmation(user)
    @name = user.name
    mail to: user.email, subject: 'Aðgangur þinn hefur verið virkjaður'
  end
end
