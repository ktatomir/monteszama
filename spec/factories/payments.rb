FactoryGirl.define do
  factory :payment do
    user
    order
    quant 50
  end
end
