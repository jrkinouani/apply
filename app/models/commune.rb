class Commune < ApplicationRecord
  has_many :commune_street
  has_many :streets, through: :commune_street
  belongs_to :intercommunality, required: false
  validates :name, presence: true
  validates :code_insee, presence: true
  validates :code_insee, exclusion: ["172"]
end
