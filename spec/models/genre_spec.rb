require 'rails_helper'

describe Genre do
  describe 'associations' do
    it { should have_many :songs }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
