class User < ApplicationRecord
  self.primary_key = "labtech_id"
  #has_many :tickets
  belongs_to :location
  has_many :tickets
  has_many :clients
  has_many :dispatches
  has_many :contract_services
  has_many :tasks, through: :todo_lists
  has_many :todo_lists
  has_many :labtech_times
  has_many :labtickets
  #has_and_belongs_to_many :clients
  #has_many :clients
  
  accepts_nested_attributes_for :labtech_times
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
end
