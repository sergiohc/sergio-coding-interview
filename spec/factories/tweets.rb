FactoryBot.define do
  factory :tweet do
    body { Faker::Quote.yoda }
    user { create(:user) }
  end
end
