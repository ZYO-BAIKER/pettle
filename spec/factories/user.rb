FactoryBot.define do
  factory :user do
    nickname              { 'ナダル' }
    email                 { "test@example" }
    password              { "sample2" }
    password_confirmation { password }
    prefecture_id         { 48 }
    city                  { '横浜市緑区' }
    sex_id                { 4 }
    age_id                { 9 }
  end
end