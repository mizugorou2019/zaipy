FactoryBot.define do
  factory :order_delivery do
    token         { 'test' }
    post_code     { '123-4567' }
    prefecture_id { 1 }
    city          { '札幌市' }
    house_number  { '青葉区蒼葉1-1' }
    building_name { '東京ハイツ' }
    phone_number  { '0225123456' }
  end
end
