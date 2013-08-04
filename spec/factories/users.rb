FactoryGirl.define do
  factory :user, aliases: [:owner, :caller] do
    login "Kasia"
    email "me@kasia.pl"
  end
end
