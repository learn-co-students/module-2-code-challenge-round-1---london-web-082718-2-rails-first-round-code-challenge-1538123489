class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true, presence: true
  validates :power, uniqueness: true, presence: true
end
