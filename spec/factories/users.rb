require 'faker/japanese'
gimei = Gimei.name
FactoryBot.define do
  factory :user do
    name                  { gimei.kanji }
    name_kana             { gimei.katakana }
    tel_num               { '09012345678' }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
