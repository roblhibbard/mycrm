class ChangeCommentName < ActiveRecord::Migration[5.0]
  def change
    rename_table :comments, :ticket_comments
  end
end
