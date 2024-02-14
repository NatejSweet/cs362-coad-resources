FactoryBot.define do
  factory :organization do
    sequence(:email) { |n| "test#{n}@email.com" }
    sequence(:name) { |n| "Test Organization #{n}" }
    phone { '541-111-1111' }
    primary_name { 'test primary name' }
    secondary_name { 'test secondary name' }
    secondary_phone { '541-222-2222' }
    trait :approved do
        status { :approved }
        end
    
    trait :rejected do
        status { :rejected }
        end
  end
end