FactoryBot.define do
    factory :ticket do
      name { "Test Ticket" }
      description { "Test Description" }
      phone { "541-111-1111" }
      region_id { 1 }
      resource_category_id { 1 }
      organization_id { 1 }
    end
  end