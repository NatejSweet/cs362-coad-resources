FactoryBot.define do
    factory :ticket do
      name { "Test Ticket" }
      description { "Test Description" }
      phone { "+1-555-555-1212" }
      region_id { 1 }
      resource_category_id { 1 }
      organization_id { 1 } 
    end
  end