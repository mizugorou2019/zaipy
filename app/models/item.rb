class Item < ApplicationRecord
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :image, :category_id,  presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :quantity, presence: true, length: { maximum: 3 }

  with_options presence: true do
    validates :quantity, inclusion: { in: 0..999, message: 'is out of range' }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end
