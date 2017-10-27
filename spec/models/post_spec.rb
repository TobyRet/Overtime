require 'rails_helper'

describe Post, type: :model do
  describe 'Creation' do

    before do
      @user = User.create!(first_name: 'T', last_name: 'R', email: 't@t.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')
      @post = Post.create(date: Date.today, user_id: @user.id, rationale: 'Anything')
    end
    
    it 'can be created' do
      expect(@post).to be_valid
    end


    it 'cannot be created without date and rationale' do
      @post.date = nil
      @post.rationale = nil

      expect(@post).to_not be_valid 
    end
  end
end
