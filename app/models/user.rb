class User < ApplicationRecord
  enum role: %I[guest customer admin]

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  scope :customers, -> { where(role: 'customer') }

  after_create :send_welcome_mail

  private

  def send_welcome_mail
    ApplicationMailer.send_new_user_message(self).deliver if self.customer?
  end
end
