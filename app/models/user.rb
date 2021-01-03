class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  belongs_to_active_hash :age

  with_options numericality: { other_than: 1, message: 'を選んで下さい' } do
    validates :sex_id, :age_id
  end
end
