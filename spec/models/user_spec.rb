require 'rails_helper'

describe User, type: :model do
  before :each do
    @user = FactoryBot.create(:user) 
  end

  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end
  end

  describe 'validations' do
    it 'cannot be created without first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'cannot be created without last name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'cannot be created without phone number' do
      @user.phone_number = nil
      expect(@user).to_not be_valid
    end

    it 'required the phone attr to only contain integers' do
      @user.phone_number = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'required the phone attr to only contain 10 characters' do
      @user.phone_number = '1234567891011'
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method that combines first name and last name' do
      expect(@user.full_name).to eq('SNOW, Jon')
    end
  end
end
