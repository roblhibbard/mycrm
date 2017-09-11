class ExternalLabtechController < ApplicationController
 
 def index
   
   @external_ticket = ExternalLabtech.where(ClientID: 1)
   
 end 
  
end
