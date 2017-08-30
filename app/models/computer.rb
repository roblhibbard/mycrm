class Computer < ApplicationRecord
  belongs_to :client
  belongs_to :ticket
  belongs_to :labtech_computer
  has_many :items
  #has_many :tickets
  has_many :anti_viri
  has_many :contract_services
  has_many :backups
  has_many :backup_pcs
  
 
 #require 'elasticsearch'
 
 
 
 searchkick text_start: [:corepc_number]
 Computer.reindex
 #scope :search_import, -> { includes(:client) }
 def search_data
      {
        corepc_number: corepc_number.present?
        
      }
    end
 
 #def self.search(term)
  #where('LOWER(corepc_number) LIKE :term OR LOWER(user_login) LIKE :term', term: "%#{term.downcase}%")
#end
  paginates_per 10
end
