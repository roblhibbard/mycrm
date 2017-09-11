Rails.application.routes.draw do
  
  resources :lab_ticket_statuses
  resources :backup_pcs
  resources :labtech_client_other_data
  resources :labtech_times do
      get :support_hours_report, :on => :collection
      get :client_timesheet_report, :on => :collection
      
  collection do
      get :import_timeslips
      get :update_timeslips
      get :client_hours_report
      
    end
  end
   
  resources :labtickets do
    get :open_tickets, :on => :collection
    get :qbr_tickets,  :on => :collection
    get :critical_drive,  :on => :collection
     get :printer_tickets,  :on => :collection
     get :extra_data,  :on => :collection
     get :c_tickets, :on => :collection
     get :new_tickets, :on => :collection
     get :monitors, :on => :collection
    collection do
      get 'ticket'
      get 'show_labticket'
      post 'make_labticket'
      get 'hd_critical'
      get 'download_tickets'
      end
    end
  resources :task_options
  resources :labtech_computers do
    collection do
      get :sync_computers
    end
  end
  
  resources :labtech_locations do
    collection do
      get :import_location
    end
  end
  
    
  resources :todo_lists
  resources :contract_service_lines
  resources :service_lists
  resources :service_types
  
  resources :computers
  resources :parts
  
  resources :locations
   
  
  resources :labtech_timeslips
  
 # get "create_ticket", to: "labtickets#create_ticket"
  
  
  resources :labtech_clients do
    resources :labtech_locations, :labtech_computers, :labtech_times
    get :get_client, :on => :collection
    collection do
      get :import_clients
      get :update_clients
      get 'lab_client'
    end
  end
   
  devise_for :users
  get 'sign_in' => 'devise/sessions#new'
  resources :labtech_audits do
    collection {post :import } 
  end
  get 'labtech_clients/import'
   resources :repairs do
    resources :malwares
  end
  put 'complete_malware', to: 'malwares#complete', as: :complete_malwares
  resources :malwares
 
  resources :repair_malware_cleans
  resources :repair_categories
  resources :events
  resources :projects do
    resources :comments
  end
  resources :assigned_teches
  resources :systems
  resources :comments do
    resources :comments
  end
  resources :types
  
  resources :tickets do
    resources :diagnostics
    resources :comments
  end
  resources :diagnostics
  
  resources :tickets do
    resources :ticket_comments
  end
  
  resources :backups do
    resources :comments
    resources :todo_lists
    collection do
      get 'merge'
      end
  end
  resources :contract_services do
    get :index2, :on => :collection
    collection do
      get 'merge'
    end
  end
  
  resources :anti_viri
  resources :issues
  resources :priorities
  resources :b_tasks do
    collection {post :import}
  end
 resources :clients do
    resources :tickets, :backups, :anti_viri, :contract_services, :comments
    collection do 
      get  :autocomplete 
      get 'merge'
      post :import 
    
     end
   end
  
   resources :dispatches do
    collection do 
      get  :autocomplete  
     end
   end
   
 get "/non_active", to: "contract_services#non_active", as: :non_active_contract_service
    
 
  resources :backups do
    resources :b_tasks
    resources :comments
  end
  resources :items
 
  resources :communications
  resources :tasks
  resources :it_services
  resources :service_categories
  resources :statuses
  resources :tests
  
  resources :pages
  
  get '/login', to: 'pages#login'
  
  # This is where we are redirected if OmniAuth successfully authenticates
  # the user.
  match '/auth/:provider/callback', to: 'pages#callback', via: [:get, :post]
  
  match '/send_mail', to: 'pages#send_mail', via: [:post]

  match '/disconnect', to: 'pages#disconnect', via: [:get]
  
  
  #get '/support_hours_report', to: 'labtech_times#support_hours_report', via: [:get], controller: 'labtech_times'
  root to: "welcome#index"
  get '/clients/search/:q', :to => 'clients#search', :as => :search
  resources :welcome do
    get :daily_hours_report, :on => :collection 
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
