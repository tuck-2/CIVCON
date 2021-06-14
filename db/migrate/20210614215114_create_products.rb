class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :company_id, null: false
      t.integer :type_id, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
