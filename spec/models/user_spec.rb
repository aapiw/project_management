require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) } # Using FactoryBot for test data

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_format_of(:email).with(URI::MailTo::EMAIL_REGEXP) }

    it { should validate_length_of(:password).is_at_least(6).on(:create) }
    it { should validate_length_of(:password).is_at_least(6).on(:update) }
  end

  describe 'associations' do
    it { should have_many(:project_assignments) }
    it { should have_many(:projects).through(:project_assignments) }
  end

  describe 'enum' do
    it { should define_enum_for(:role).with_values([:admin, :user]) }
  end

  describe 'password_digest' do
    it { should have_secure_password }
  end
end
