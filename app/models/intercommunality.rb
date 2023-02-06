class Intercommunality < ApplicationRecord
	has_many :communes
	validates :name, presence: true
	validates :siren,presence: true, uniqueness: { case_sensitive: false }
	validates :siren, exclusion: ["243 400 017","24340001700"]
	validates :form, inclusion: ["ca", "cu" ,"cc" ,"met"] 

	before_save :generate_slug

	def communes_hash
		communes_by_code = {}
		self.communes.each do |commune|
			communes_by_code[commune.code_insee] = commune.name
		end
		return communes_by_code
	end

	def population
		sum = 0
		communes.each do |commune|
			sum = sum + commune.population
		end
		sum
	end

	private

	def generate_slug
		self.slug = name.downcase.gsub(" ", "-").parameterize if self.slug.nil? && name.present?
	end

end
