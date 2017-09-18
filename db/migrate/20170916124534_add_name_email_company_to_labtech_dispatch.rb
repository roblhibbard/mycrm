class AddNameEmailCompanyToLabtechDispatch < ActiveRecord::Migration[5.1]
  def change
    add_column :labtech_dispatches, :name, :string
    add_column :labtech_dispatches, :company, :string
    add_column :labtech_dispatches, :email, :string
  end
end
