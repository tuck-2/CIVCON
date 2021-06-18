class RenameDescroptionColumnToEstimates < ActiveRecord::Migration[5.2]
  def change
    rename_column :estimates, :descroption, :description
  end
end
