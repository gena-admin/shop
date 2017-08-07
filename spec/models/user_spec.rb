require 'rails_helper'

describe User, type: :model do
  before { allow_any_instance_of(User).to receive(:send_welcome_mail) }

  context 'associations' do
    it { is_expected.to have_many(:orders) }
  end

  context 'validations'do
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity  }
  end

  context 'create new user' do
    let(:user) { FactoryGirl.create(:user) }

    it 'should have customer role by default' do
      expect(user).to be_customer
    end

    it 'should send email to user' do
      allow_any_instance_of(User).to receive(:send_welcome_mail).and_call_original
      expect(ApplicationMailer).to receive_message_chain(:send_new_user_message, :deliver)

      user
    end
  end
end
