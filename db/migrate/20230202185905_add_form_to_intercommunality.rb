class AddFormToIntercommunality < ActiveRecord::Migration[7.0]
  def change
    add_column :intercommunalities, :form, :string
  end
end
