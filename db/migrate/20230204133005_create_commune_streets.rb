class CreateCommuneStreets < ActiveRecord::Migration[7.0]
  def change
    create_table :commune_streets do |t|
      t.references :commune, null: false, foreign_key: true
      t.references :street, null: false, foreign_key: true

      t.timestamps
    end
  end
end
