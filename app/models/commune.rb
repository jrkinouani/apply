class Commune < ApplicationRecord
  has_many :commune_street
  has_many :streets, through: :commune_street
  belongs_to :intercommunality, required: false
  validates :name, presence: true
  validates :code_insee, presence: true
  validates :code_insee, exclusion: ["172"]

  def self.search(query)
    self.where("lower(name) LIKE ?", "%#{sanitize_sql_like(query.downcase)}%")
  end

  def self.to_hash
    communes_by_code = {}
    self.all.each do |commune|
      communes_by_code[commune.code_insee] = commune.name
    end
    communes_by_code
  end
  
end
