class Intercommunality < ApplicationRecord
	has_many :communes
	validates :name, presence: true
	validates :siren,presence: true, uniqueness: { case_sensitive: false }
	validates :siren, exclusion: ["243 400 017","24340001700"]
	validates :form, inclusion: ["ca", "cu" ,"cc" ,"met"] 
end
