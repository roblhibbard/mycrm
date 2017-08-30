class ChangeSignupToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :backups, :signup_date, :date
  end
end
