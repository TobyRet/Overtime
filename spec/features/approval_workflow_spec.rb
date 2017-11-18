require 'rails_helper'

describe 'Navigate' do
  before do 
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
      visit edit_post_path(@post)
    end

    it 'has a status that can be edited on the form' do
      choose('post_status_approved')

      expect(@post.status).to eq('approved')
    end

    it 'cannot be added by a non admin' do
      logout :user
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)

      visit edit_post_path(@post)

      expect(page).to_not have_content('Approved')
    end

    it 'should not be editable by the post creator if status is approved' do
      logout :user
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)

      @post.update(user_id: @user.id, status: 'approved')

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end
end