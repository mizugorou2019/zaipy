class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:name]

  has_many :orders
  has_many :pickups

  validates :name, presence: true, length: { maximum: 15 }
  validates :tel_num, presence: true, length: { maximum: 11 }
  # validates_presence_of :name
  validates :password, confirmation: true, length: { minimum: 8 }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :name_kana, format: { with: /\A[ァ-ン]/, message: 'is invalid. Input full-width katakana characters.' }

    validates :tel_num, format: { with: /\A0[5789]0\d{8}\z/, message: 'is invalid. Input only digits. Hyphen is unnecessary.' }

    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'needs alphabet and number' }
  end
end
