require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Role, type: :model do
  context 'Role associations tests' do
    it { should have_many(:users) }
  end
  context 'Validations for roles' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20).with_long_message('20 characters in role name is the maximum allowed.') }
  end
end