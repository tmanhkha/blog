require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to allow_value('contactemail@gmail.com').for(:email)}
    it { is_expected.not_to allow_value('contactemail').for(:email)}
  end
end
