class AddDefaultStatusToEstimate < ActiveRecord::Migration[5.2]
  def change
    change_column :estimates, :status, :integer, null: false, default: 0
  end
end
