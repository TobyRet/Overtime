require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany,
    id: Field::Number,
    email: Field::String.with_options(searchable: true),
    password: Field::String,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    first_name: Field::String,
    last_name: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    phone_number: Field::String
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :posts,
    :id,
    :email,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :posts,
    :phone_number,
    :email,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :first_name,
    :last_name,
    :type,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :email,
    :password,
    :first_name,
    :last_name,
    :type,
    :phone_number
  ].freeze

end
