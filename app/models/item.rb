class Item < ApplicationRecord
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :image, :category_id,  presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :quantity, presence: true

  with_options presence: true do
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end
