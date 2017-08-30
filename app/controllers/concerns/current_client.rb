module CurrentClient
  extend ActiveSupport::Concern

  private

 # def set_client
  #  @current_client = Client.find(session[:client_id])
   # end
    def current_client
    if !session[:client_id].nil?
      Client.find(session[:client_id])
    else
      Client.new
    end
  end
end
