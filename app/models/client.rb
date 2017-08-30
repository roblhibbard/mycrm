class Client < ApplicationRecord  
  require 'csv'
  nilify_blanks
  belongs_to :user
  belongs_to :location
  has_many :dispatches
  has_many :backups
  has_many :items
  has_many :communications
  has_many :issues
  has_many :priorities
  has_many :contract_services, dependent: :destroy
  has_many :contract_service_lines
  has_many :service_lists
  has_many :comments, as: :commentable
  has_many :tasks, as: :multitaskable
  has_many :backup_pcs
  
   has_many :systems 
   has_many :tickets
   has_many :computers
   has_many :parts
   has_many :anti_viri
   has_many :tasks, through: :todo_lists
   has_many :todo_lists
   
   #after_commit :reindex_clients
 
  accepts_nested_attributes_for :computers
  accepts_nested_attributes_for :anti_viri
  accepts_nested_attributes_for :systems
  accepts_nested_attributes_for :contract_services, allow_destroy: true
  accepts_nested_attributes_for :contract_service_lines
  accepts_nested_attributes_for :tickets
  accepts_nested_attributes_for :backup_pcs
  #accepts_nested_attributes_for :backup_pcs
    #def self.search(params)
     #left_outer_joins(:computers, :tickets).where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR LOWER(email) LIKE ? OR LOWER(company) LIKE ? OR corepc_number LIKE ? OR phone_number LIKE ? 
     #OR ticket_id LIKE ? ", 
            #"%#{search}%", "%#{search}%","%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
 
    #end
  #searchkick 
  
  searchkick text_start: [:first_name, :last_name, :company, :phone_number, :email, :corepc_number]
  #puts Client.reindex
  #puts Computer.reindex
  #searchkick.search params[:query], index_name: [Client, Ticket]
  
  scope :search_import, -> { includes(:computers) }
  
    def search_data
     attributes.merge(
     computer_corepc_number: computers.map(&:corepc_number),
     computer_id: computers.map(&:id)
     )
    end
  #  def reindex_clients
  #  clients.each do |client|
  #    client.reindex
   # end
  #end
    def full_name
    "#{self.first_name} #{self.last_name}"
    end 

    def self.import(file)
     CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
       
       client_hash = row.to_hash
       client = Client.where(:first_name => client_hash["first_name"], :last_name => client_hash["last_name"])
       if client.count ==1
         client.first.update_attributes(client_hash)
         else                             
       Client.create!(client_hash)
       end
      end
     
     
    def full_address
      [address, city, state].compact.join(‘,‘)
    end   
  
  end
  paginates_per 10
end
