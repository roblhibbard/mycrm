@response['value'].each do |key|
           LabtechClient.create(
           name: key["Name"],
           company_name: key["Company"],
           first_name: key["Firstname"],
           last_name: key["LastName"],
           address1: key["Address1"],
           address2: key["Address2"],
           city: key["City"],
           state: key["State"],
           phone: key["Phone"],
           client_id: key["ClientID"] 
           )
         end