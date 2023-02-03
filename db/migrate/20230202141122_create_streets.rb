class CreateStreets < ActiveRecord::Migration[7.0]
  def change
    create_table :streets do |t|
      t.string :title
      t.integer :from
      t.integer :to
      t.references :commune, null: false, foreign_key: true

      t.timestamps
    end
  end
end
