class UserMailer < Devise::Mailer
  default from: "musterikaerleikans@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
  def new_user(user)
    mail to: "musterikaerleikans@gmail.com", subject: 'New user awaiting confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmation.subject
  #
  def confirmation(user)
    @name = user.username
    mail to: user.email, subject: 'Thanks for registering'
  end
end
