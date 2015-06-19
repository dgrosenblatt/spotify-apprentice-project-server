FactoryGirl.define do
  factory :genre do
    sequence(:name) { |n| "Genre du jour #{n}" }
  end
end
