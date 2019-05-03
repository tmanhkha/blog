require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'associations' do
    it { is_expected.to have_many :comments }
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :creator }
  end

  context 'validates' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
