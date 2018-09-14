FactoryBot.define do

  sequence(:id) { |n| "#{n}"}


  factory :product do
    id
    name {"Janet"}
    description {"lovely"}
    price {100}
    color {"blue"}
  end

end
