class User < ApplicationRecord
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :phone_number

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone_number, with: PHONE_REGEX
  validates :phone_number, length: { is: 10 }

  def full_name
    last_name.upcase + ', ' + first_name
  end
end
