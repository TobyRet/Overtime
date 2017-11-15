require 'rails_helper'

describe 'navigate' do
  before do
    logout(:user)
    user = FactoryBot.create(:user) 
    login_as(user, scope: :user)
  end
  j
  describe 'index' do
    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/) 
    end

    it 'has a list of posts' do
      post1 = FactoryBot.build_stubbed(:post) 
      post2 = FactoryBot.build_stubbed(:second_post)

      visit posts_path

      expect(page).to have_content(/Rationale|rationale/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path

      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      post = FactoryBot.create(:post)
      visit posts_path

      click_link("delete_post_#{post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from the new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'

      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end

    it 'will have a new user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end

  describe 'edit' do
    before do
      logout(:user)
      @editor = User.create!(first_name: 't', last_name: 'p', email: 'p@p.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')
      @post = Post.create(date: Date.today, rationale: 'pants', user_id: @editor.id)
      login_as(@editor, scope: :user)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on 'Save'

      expect(page).to have_content('Edited content')
    end

    it 'cannot be edited by a non authorised user' do
      logout(:user)

      non_authorised_user = FactoryBot.create(:non_authorised_user)
      login_as(non_authorised_user, scope: :user)

      visit edit_post_path @post

      expect(current_path).to eq(root_path)
    end
  end
end
