require 'rails_helper'

describe Post, type: :model do
  describe 'Creation' do

    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post) 
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without date, rationale and overtime hours' do
      @post.date = nil
      @post.rationale = nil
      @post.overtime_request = nil

      expect(@post).to_not be_valid 
    end

    it 'has an ovetime request greater than 0.0' do
      @post.overtime_request = 0.0

      expect(@post).to_not be_valid
    end
  end
end
