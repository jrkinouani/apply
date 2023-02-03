class Commune < ApplicationRecord
  has_many :streets
  belongs_to :intercommunality, required: false
  validates :name, presence: true
  validates :code_insee, presence: true
  validates :code_insee, exclusion: ["172"]
end
