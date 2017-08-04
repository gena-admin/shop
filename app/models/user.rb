class User < ApplicationRecord
  enum role: %I[guest user admin]

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


  after_create :send_welcome_mail

  private

  def send_welcome_mail
    ApplicationMailer.send_new_user_message(self).deliver
  end
end
