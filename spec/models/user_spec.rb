require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
  end

  context 'enum role' do
    it { is_expected.to define_enum_for(:role).with_values([:user, :admin]) }
  end

  context 'default role' do
    let(:user) { FactoryBot.create(:user) }
    it 'default role user' do
      expect(user.role).to eq('user')
    end
  end

  context 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name) }
  end
end
