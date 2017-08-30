module ContractServicesHelper
  def contract_service_lines
     @contract_service_lines = ContractServiceLine.where("contract_service_id = ? ","#{params[:id]}")
  end
   def service_list_charge
    ServiceList.all
  end
end
