FactoryGirl.define do
  factory :admin, class: User do
    username "nick"
    email "nicknarh@gmail.com"
    password_digest "1234"
    admin true
  end

  factory :user, class: User do
    username "sean"
    email "seany789@gmail.com"
    password_digest "1234"
    admin false
  end
end
