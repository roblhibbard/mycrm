class ChangeLineCommentFromStringToTextContractServiceLines < ActiveRecord::Migration[5.0]
  def change
    change_column :contract_service_lines, :line_comment, :text
  end
end
