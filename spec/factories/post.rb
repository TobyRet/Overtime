FactoryBot.define do
  factory :post do
    date Date.today
    rationale 'Some rationale'
    status 'approved'
    user
  end

  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale 'Some more rationale'
    user
  end

  factory :post_from_other_user, class: 'Post' do
    date Date.yesterday
    rationale 'Even more rationale'
    non_authorised_user
  end
end
