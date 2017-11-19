FactoryBot.define do
  factory :post do
    date Date.today
    rationale 'Some rationale'
    overtime_request 2.5
    status 'approved'
    user
  end

  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale 'Some more rationale'
    overtime_request 2.5
    user
  end

  factory :post_from_other_user, class: 'Post' do
    date Date.yesterday
    rationale 'Even more rationale'
    overtime_request 2.5
    non_authorised_user
  end
end
