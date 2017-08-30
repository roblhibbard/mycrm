module BackupsHelper
  def backup_pcs
     @backup_pcs = BackupPc.where("backup_id = ? ","#{params[:id]}")
  end
   def backup_computer
   LabtechComputer.left_outer_joins(:computers).all
  end
  def res_computers
    Computer.all
  end
  
end
