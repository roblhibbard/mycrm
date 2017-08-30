class CreateContractServiceLines < ActiveRecord::Migration[5.0]
  def change
    create_table :contract_service_lines do |t|
      t.decimal :qty, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :tax_rate, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :tax, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :price, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :sub_total, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :total_price, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.string  :line_comment, :limit => 255
      t.belongs_to :contract_service, foreign_key: true
      t.belongs_to :service_list, foreign_key: true

      t.timestamps
    end
  end
end
