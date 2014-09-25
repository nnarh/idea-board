FactoryGirl.define do
  factory :admin, class: User do
    username "nick"
    email "nicknarh@gmail.com"
    password_digest "1234"
    admin true
  end
end
