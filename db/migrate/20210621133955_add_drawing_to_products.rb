class AddDrawingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :drawing, :string
  end
end
