class User < ApplicationRecord
  enum role: %I[guest customer admin]

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  scope :customers, -> { where(role: 'customer') }
  has_many :orders

  validates_uniqueness_of :email


  after_create :send_welcome_mail
  before_create :set_role

  private

  def send_welcome_mail
    ApplicationMailer.send_new_user_message(self).deliver if self.customer?
  end

  def set_role
    self.role = 1 if self.guest?
  end
end
