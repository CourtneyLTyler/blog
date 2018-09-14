FactoryBot.define do

  sequence(:email) { |n| "user#{n}@example.com"}


  factory :user do
    email
    password {'abc-123'}
    first_name {'Jane'}
    last_name {'Doe'}
    admin {false}
  end

  factory :admin, class: User do
    email
    password {'abc-123'}
    admin {true}
    first_name {'Admin'}
    last_name {'User'}
  end

end
