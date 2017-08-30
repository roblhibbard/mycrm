class Dispatch < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :client
  #before_action :daily_phone_calls
  
  searchkick text_start: [:details, :user_id, :phone]
  Dispatch.reindex
  
  scope :ticketed_dispatch, -> { where('ticket <> ""')}
  scope :daily_phone_calls, -> { where('DATE(created_at) = ?', Date.today)}
  scope :yesterday_phone_calls, -> { where('DATE(created_at) = ?', Date.yesterday)}
  #scope :this_week_phone_calls, -> { where('DATE(created_at) = ?', Dispatch.this_week) }
  def search_data
      {
        details: details,
        phone: phone,
        user: user_id,
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
   self.daily_phone_calls = Dispatch.daily_phone_calls.count
   self.yesterday_phone_calls = Dispatch.yesterday_phone_calls.count
   self.this_week_phone_calls = Dispatch.this_week_phone_calls.count
   self.last_week_phone_calls = Dispatch.last_week_phone_calls.count
   
  end  
  
  
   paginates_per 10
end
