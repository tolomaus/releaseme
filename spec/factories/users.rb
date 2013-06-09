# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence (:name){|n| "Test User #{n}" }
    sequence(:email) {|n| "testuser#{n}@example.com" }
    password 'changeme'
    password_confirmation 'changeme'
    organization
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end
end