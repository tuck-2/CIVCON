class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.integer :product_id, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
