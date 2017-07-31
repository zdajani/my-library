FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    summary  { Faker::Lorem.sentences(10) }
    year  1940
    pages { Faker::Number.number(3) }
    authors { |a| [a.association(:author)] }
  end
end