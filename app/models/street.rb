class Street < ApplicationRecord
  has_many :communes
  validates :title, presence: true
  validates :from, numericality: true, allow_nil: true
  validates :to, numericality:  {greater_than: :from}, allow_nil: true
end
