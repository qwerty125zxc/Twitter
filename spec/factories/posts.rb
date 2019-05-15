FactoryBot.define do
  factory :post do
    title {"Test title"}
    body { "Some Description" }
    like { 0 }
  end
end
