# キューポイントクラス
class Cuepoint < ApplicationRecord
  has_and_belongs_to_many :campaigns
  validates :name, presence: true, uniqueness:true, length: { maximum: 20 }
  validates :name, presence: true, uniqueness:true, length: { minimum: 5 }
end