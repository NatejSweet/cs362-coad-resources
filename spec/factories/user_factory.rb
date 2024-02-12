FactoryBot.define do
        factory :user do
            email { 'fake@email.com'}
            password { 'password'}

            before(:create) {|user| user.skip_confirmation!}
            trait :organization_approved do
                role{:organization}
                organization_id{create(:organization, :approved).id}
            end

            trait :admin do
                role{:admin}
            end

            trait :organization_rejected do
                role{:organization}
                organization_id{create(:organization, :rejected).id}
            end
        end
    end