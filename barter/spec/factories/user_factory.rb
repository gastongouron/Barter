FactoryGirl.define do
  factory :user do
    name  "Paul"
    email "sample@example.com"
    password "lolilol88"
    password_confirmation "lolilol88"
    factory :admin_user do
      admin true
    end
  end
end