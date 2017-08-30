class TodoList < ApplicationRecord
  has_many :b_tasks, dependent: :destroy
  accepts_nested_attributes_for :b_tasks, 
                                allow_destroy: true, 
                                reject_if: proc { |att| att['description'].blank? }
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, 
                                allow_destroy: true, 
                                reject_if: proc { |att| att['description'].blank? } 
  belongs_to :backup, optional: true
  belongs_to :client, optional: true
  belongs_to :user, optional: true
  belongs_to :ticket, optional: true
  has_many :task_options    
  
  scope :completed, -> {where complete: true}
  scope :incomplete, -> {where complete: false}
  
  def self.find_complete
    TodoList.where(complete: true).order('id DESC')
  end
   def self.find_incomplete
    TodoList.where(complete: false).order('id DESC')
  end
  
  def backup_full_name
    self.full_name = todo_list.backup.full_name
    end 
    paginates_per 10                                               
end
