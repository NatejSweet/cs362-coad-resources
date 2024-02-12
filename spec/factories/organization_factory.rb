FactoryBot.define do
  factory :organization do
    name { 'Test Organization' }
    email { 'test@email.com' }
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