FactoryGirl.define do
  factory :author do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
    
    factory :author_with_book do
      books { |a| [a.association(:book)] }
    end
  end
end
