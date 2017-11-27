FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name 'Jon'
    last_name 'Snow'
    email { generate :email } 
    phone_number '0876789879'
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :admin_user, class: 'AdminUser' do
    first_name 'Admin'
    last_name 'User'
    email { generate :email } 
    phone_number '0876789879'
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :non_authorised_user, class: 'User' do
    first_name 'Non'
    last_name 'Authorised User'
    email { generate :email } 
    phone_number '0876789879'
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end
end
