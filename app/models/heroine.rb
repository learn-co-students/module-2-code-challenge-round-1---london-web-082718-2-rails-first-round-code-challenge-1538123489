class Heroine < ApplicationRecord

  belongs_to :power
  delegate :name, to: :power, prefix: true
  validates :super_name, uniqueness: true

end
