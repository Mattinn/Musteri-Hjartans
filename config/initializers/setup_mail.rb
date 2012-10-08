ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "musterikaerleikans@gmail.com",
  :password             => "MusteriMusteri",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
