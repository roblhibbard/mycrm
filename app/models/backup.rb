class Backup < ApplicationRecord
  belongs_to :client
  #has_many :tasks
  has_many :comments, as: :commentable
  has_many :b_tasks, :dependent => :destroy
  has_many :communications, :dependent => :destroy
  belongs_to :service_list
  belongs_to :service_type
  belongs_to :computer 
  has_many :tasks, through: :todo_lists
  has_many :todo_lists
  has_many :backup_pcs, :dependent => :destroy
  has_many :labtech_computers 
  accepts_nested_attributes_for :backup_pcs,  reject_if: proc { |attributes| attributes['notes'].blank? }, allow_destroy: true
  
   #def self.import(file)
  # CSV.foreach(file.path, headers: true) do |row|
     #backup = find_by_id(row['id']) || new
     #Backup.create! row.to_hash
    
     #backup.save!
     
     def self.search(search)
      where("backup_account LIKE ? OR @client.full_name LIKE ? OR client_last_name LIKE ? OR client_id LIKE ?", 
            "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
 def full_name
  
    "#{self.client.first_name} #{self.client.last_name}"
    
  end
      
   paginates_per 10
  end
