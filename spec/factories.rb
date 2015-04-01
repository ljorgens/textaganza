FactoryGirl.define do
  factory :user do
    email("tucker@aol.com")
    password("secret5450")
    user_number("123456789")
  end

  factory :message do
    to("4154105984")
    body("So many yaks")
    from('5483584548')
    user_id(1)
  end
end
