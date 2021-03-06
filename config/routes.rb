Rails.application.routes.draw do
  resources :equipment
  resources :priorities
  mount Maily::Engine, at: '/maily'
  ActiveAdmin.routes(self)
  resources :customer_vendors
  resources :pricing_categories
  resources :customer_companies
  resources :vehicles
  resources :companies do
    get 'search_suggestions', on: :collection
  end
  resources :notify_types
  resources :notifications
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :upload_categories
  resources :franchise_users
  resources :franchises
  resources :vendor_upload_types
  resources :tracker_tasks
  resources :trackers
  resources :assignment_types
  resources :referral_types
  resources :corporate_referral_types
  resources :contacts
  devise_for :users
  resources :articles
  resources :franchise_zipcodes
  resources :oncalls do
    collection {post :sort}
  end
  resources :forms
  resources :vendor_categories
  resources :vendors do
    resources :vendor_uploads
  end
  resources :phones
  resources :addresses
  resources :calls
  resources :consumables
  resources :chemicals
  post 'calls/precall-lookup' => 'calls#precall_lookup'
  post 'calls/precall-webhook' => 'calls#precall'
  post 'calls/postcall-webhook' => 'calls#postcall'
  get 'users/list' => 'users#list'
  resources :users do
    patch 'link_tsheets_user'
  end
  resources :states
  resources :agents
  resources :adjusters

  get 'adwords' => 'adwords#index'
  get 'jobs/list' => 'jobs#list'
  get 'jobs/for_table' => 'jobs#for_table'
  get 'jobs/index_search' => 'jobs#index_search'
  get 'jobs/search' => 'jobs#search', as: :job_search
  get 'jobs/:id/calls' => 'jobs#calls', as: :job_calls
  get 'jobs/:id/calls/new' => 'jobs#add_call', as: :new_job_call
  post 'jobs/:id/calls' => 'jobs#create_call', as: :create_job_call
  resources :insurance_companies
  resources :notes
  get 'job_managers' => 'job_managers#list'
  get 'work_orders' => 'work_orders#list'

  get 'users/:id/job-assignments' => 'users#job_assignments', as: :user_job_assignments
  get 'users/:id/job-assignments/list' => 'users#job_assignments_list', as: :user_job_assignments_list
  get 'jobs/:id/create_estimate' => 'jobs#create_estimate', as: :create_estimate
  get 'jobs/:id/create_estimate_sent' => 'jobs#create_estimate_sent', as: :create_estimate_sent
  get 'jobs/:id/create_contract' => 'jobs#create_contract', as: :create_contract
  get 'jobs/:id/create_contract_sent' => 'jobs#create_contract_sent', as: :create_contract_sent
  get 'pipeline' => 'pipeline#index'
  get 'jobs/new-york-datasheet' => 'jobs#new_york_datasheet', as: :new_york_datasheet

  resources :jobs do
    post 'manager-assignment' => 'jobs#manager_assignment', as: :manager_assignment
    delete 'manager-assignment/:id' => 'jobs#destroy_manager_assignment', as: :destroy_manager_assignment
    post 'caller-assignment' => 'jobs#caller_assignment', as: :caller_assignment
    get 'notes' => 'notes#job_notes'
    get 'overview' => 'overview#index', as: :overview
    get 'loss-sheet' => 'loss_sheet#index', as: :loss_sheet
    get 'reconciliation-form'
    get 'customers/:id' => 'jobs#customer', as: :customer
    resources :ticsheets
    resources :properties
    resources :losses
    resources :callers
    resources :occupants
    resources :job_details
    resources :job_managers
    resources :pricings
    resource :job_coordinator, only: %i(create destroy)
    get 'job_managers/:id/acknolwedge' => 'job_managers#acknolwedge'
    get 'work_orders/:id/acknolwedge' => 'work_orders#acknowledge'
    resources :vendor_assignments
    resources :contact_assignments
    post 'agents/samecaller' => 'agents#samecaller'
    post 'adjusters/samecaller' => 'adjusters#samecaller'
    post 'agents/remove_from_job' => 'agents#remove_from_job', as: :remove_agent
    post 'adjuster/remove_from_job' => 'adjusters#remove_from_job',  as: :remove_adjuster
    post 'customers/samecaller' => 'customers#samecaller', as: :customer_same_as_caller
    resources :emergency_contacts
    post 'emergency_contacts/samecaller' => 'emergency_contacts#samecaller'
    resources :uploads
    get 'job_forms/dowload/:id' => 'job_forms#download'
    resources :job_forms
    get 'job_forms/new/:id' => 'job_forms#new_form', as: :create_form
    resources :work_orders do
      get 'archive', on: :member
      get 'unarchive', on: :member
    end
    resources :schedulers
    resources :subscriptions
    resources :collection_subscriptions, only: [:create, :update, :destroy]
    resources :purchase_order_approvals
    resources :inspection_checklists
  end
  get "move-pricing" => 'pricings#move_to_next', as: :move_to_next

  resources :customers do
    post '/jobs/:job_id' => 'customers#send_to_sharpspring', as: :send_to_sharpspring
  end
  get 'customer_search_suggestions' => 'customers#search_suggestions'
  get 'caller_search_suggestions' => 'callers#search_suggestions'
  post 'customers/:id/calls' => 'customers#create_call', as: :create_customer_call

  post 'jobs/filter' => 'jobs#filter'
  post 'addresses/geolocate' => 'addresses#geolocate'
  post 'agents/lookup' => 'agents#lookup'
  post 'adjusters/lookup' => 'adjusters#lookup'
  get 'share/users', as: :mentionables
  root 'home#index'

  namespace :tsheets do
    resources :users, only: [:index, :update]
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :datatables do
        resources :jobs, only: :index
        resources :work_orders, only: :index
        resources :calls, only: :index
        resources :users, only: :index
        resources :job_managers, only: :index
      end
    end
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  require 'sidekiq/api'

  match "default-queue-status" => proc { [
    200,
    { "Content-Type" => "text/plain" },
    [Sidekiq::Queue.new("default").size < 20 ? "OK" : "UHOH"]
  ] }, via: :get

  match "mailer-queue-status" => proc { [
    200,
    { "Content-Type" => "text/plain" },
    [Sidekiq::Queue.new("low").size < 20 ? "OK" : "UHOH"]
  ] }, via: :get
end

