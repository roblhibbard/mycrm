module FullName
  extend ActiveSupport::Concern
  

  private

 # def set_client
  #  @current_client = Client.find(session[:client_id])
   # end
    def full_name
    "#{self.client.first_name} #{self.client.last_name}"
    end
  end
