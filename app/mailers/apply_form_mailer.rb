class ApplyFormMailer < ActionMailer::Base
  default :from => "musterikaerleikans@gmail.com"
  default :to => "musterikaerleikans@gmail.com"

  def new_message(message)
    @message = message
    # Bug: Icelandic letters no can do
    mail(:subject => "[Umsokn] #{message.subject}")
  end
end
