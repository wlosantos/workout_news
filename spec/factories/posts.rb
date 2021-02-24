FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    published { 1 }
    contrast { 1 }
    user { nil }
  end
end
