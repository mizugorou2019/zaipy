class OrderDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :user_id, :item_id, :order_id

  validates :token, :city, :house_number, presence: true

  with_options presence: true do
    POST_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze

    validates :post_code, format: { with: POST_CODE_REGEX, message: 'is invalid. Hyphen is necessary.' }

    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank." }

    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Hyphen is unnecessary.' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Delivery.create(post_code: post_code, prefecture: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
