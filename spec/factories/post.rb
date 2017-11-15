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
end
