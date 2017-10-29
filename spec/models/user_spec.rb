require 'rails_helper'

describe User, type: :model do
    before :each do
      @user = FactoryGirl.create(:user) 
    end

  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first name or last name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method that combines first name and last name' do
      expect(@user.full_name).to eq('SNOW, Jon')
    end
  end
end
