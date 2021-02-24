FactoryBot.define do
  factory :streaming do
    title { "MyString" }
    description { "MyText" }
    published { 1 }
    user { nil }
  end
end
