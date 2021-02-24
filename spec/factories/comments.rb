FactoryBot.define do
  factory :comment do
    commenter { "MyText" }
    published { 1 }
    user { "" }
    commentable { nil }
  end
end
