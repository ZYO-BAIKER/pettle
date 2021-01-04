class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  belongs_to_active_hash :age
  belongs_to_active_hash :prefecture

  with_options numericality: { other_than: 1 } do
    validates :sex_id, :age_id, :prefecture_id
  end

  validates :nickname, presence: true, length: { maximum: 10 }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true do
    validates :city
  end
end
