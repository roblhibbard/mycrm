class LabtechDispatch < ApplicationRecord
  
  has_many :labtickets, dependent: :destroy
  belongs_to :timeslip_category
  accepts_nested_attributes_for :labtickets,  reject_if: proc { |attributes| attributes['subject'].blank? }, allow_destroy: true
  
  searchkick text_start: [:name, :email, :phone, :company ]
  LabtechDispatch.reindex
  
  
  scope :daily_phone_calls, -> { where('DATE(created_at) = ?', Date.today)}
  scope :yesterday_phone_calls, -> { where('DATE(created_at) = ?', Date.yesterday)}
  #scope :this_week_phone_calls, -> { where('DATE(created_at) = ?', Dispatch.this_week) }
  
  def search_data
      {
        name: name,
        phone: phone,
        email: email,
        company: company,
      }
    end
  def self.this_week
   where(:created_at => Date.today.beginning_of_week..Date.today.end_of_week)
  end
  def self.last_week
    where(:created_at => 1.weeks.ago.beginning_of_week..1.weeks.ago.end_of_week)
  end
    
  def daily_phone_calls
   Date.beginning_of_week = :monday
   Date.end_of_week = :sunday
   #self.daily_phone_calls = Dispatch.where('DATE(created_at) = ?', Date.today)
   self.daily_phone_calls = LabtechDispatch.daily_phone_calls.count
   self.yesterday_phone_calls = LabtechDispatch.yesterday_phone_calls.count
   self.this_week_phone_calls = LabtechDispatch.this_week_phone_calls.count
   self.last_week_phone_calls = LabtechDispatch.last_week_phone_calls.count
   
  end  
  
  
   paginates_per 10
  
end
