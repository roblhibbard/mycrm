class BackupMergerer
  
   def initialize(primary_backup_id, secondary_backup_id) 
   @primary_backup = Backup.find_by(id: primary_backup_id)
    @secondary_backup = Backup.find_by(id: secondary_backup_id)
  end
 
  def call
   #@primary_backup = Backup.find_by(id: params[:primary_backup_id])
   #@secondary_backup = Backup.find_by(id: params[:secondary_backup_id])
   merge_attributes
   @primary_backup.save
   @secondary_backup.destroy
  
  end

  private
  
  attr_reader :primary_backup, :secondary_backup

  def merge_attributes
   @primary_backup.attributes = @secondary_backup.attributes.except("id", "created_at", "updated_at")
      .delete_if { |k, v| v.blank? }
  end
 end