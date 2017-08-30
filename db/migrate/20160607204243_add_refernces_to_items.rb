class AddReferncesToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :assets, :ticket, index: true
    add_reference :tickets, :asset, index: true
  end
end
