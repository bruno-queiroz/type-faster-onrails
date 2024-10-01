FactoryBot.define do
    factory :user do
      name { "John" }
      encrypted_password  { "Doe" }
      admin { false }
    end
end