class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.integer :product_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
