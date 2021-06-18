class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.integer :user_id, null: false
      t.integer :company_id, null: false
      t.integer :product_id, null: false
      t.text :descroption
      t.integer :status, null: false, defalt: 0

      t.timestamps
    end
  end
end
