class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@shop.ua'
  default template_path: 'mailers'
  layout 'mailer'

  # Sent welcome email for customers
  def send_new_user_message(u)
    mail(to: u.email, subject: "Hello #{u.email}")
  end
end
