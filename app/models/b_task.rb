class BTask < ApplicationRecord
  require 'csv'
  has_many :comments, as: :commentable
  belongs_to :backup
  belongs_to :statusrails
  belongs_to :communication
  belongs_to :todo_list, optional: true
  
  
  def self.import(file)
      CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      BTask.create! row.to_hash # exclude the price field
      
    end # end CSV.foreach
  end # end self.import(file)

 validates_presence_of :backup_id, :details, :description
end # end class
