require 'csv'
class ImportJob < ApplicationJob
  queue_as :default

  def perform(filepath)
    CSV.foreach(filepath, headers: true, :col_sep => ";", encoding: 'iso-8859-1:utf-8') do |row|
      interco = Intercommunality.find_or_create_by!(name: row['nom_complet'],
        siren: row['siren_epci'],form: row['form_epci'].first(3).downcase)
      Commune.find_or_create_by!(name: row['nom_com'], code_insee: row["insee"],
        population: row["pop_total"], intercommunality_id: interco.id)
    end
  end
end
