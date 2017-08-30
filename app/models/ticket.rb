class Ticket < ApplicationRecord
  #belongs_to :location
  
  belongs_to :issue
  belongs_to :priority
  belongs_to :user
  belongs_to :status, inverse_of: :tickets
  belongs_to :location, inverse_of: :tickets
  has_many :diagnostics
  has_many :comments, as: :commentable
  has_many :tasks, as: :multitaskable
  #has_many :priorities, as: :priortable
  has_many :systems
  #has_many :clients, through: :systems
  belongs_to :client
  #belongs_to :computer
  has_many :computers
  has_many :items
  has_many :parts
  has_many :tasks, through: :todo_lists
  has_many :todo_lists
  before_save :due_date
  
  searchkick text_start: [:ticket_id]
  
  #validates_presence_of :ticket_title, :description, :due_date, :priority, :issue, :status, :system, :client
  
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :diagnostics
  #accepts_nested_attributes_for :systems
   #def due_date
    #date =  self.created_at + 3.days
    #self.due_date = date

 # end
 
 def search_data
      {
        ticket: ticket_title.present?,
        ticket: ticket_description.present?
      }
    end
 def computer_corepc
    computers.try(:corepc_number)
  end 
  def computer_corepc=(corepc_number)
    self.computer = Computers.find_by_corepc_number(corepc_number) if corepc_number.present?
  end
  
  def self.search(search)
      joins(:client, :computers).where("last_name LIKE ? OR first_name LIKE ? OR corepc_number LIKE ? ",
            "%#{search}%", "%#{search}%", "%#{search}%")
    end
    paginates_per 10
end

