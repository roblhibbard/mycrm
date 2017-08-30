class AddIndexCommentToBackup < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :backup
  end
end
