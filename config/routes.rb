Rails.application.routes.draw do

  resources :vendor_uploads
  resources :assignment_types
  resources :corporate_referral_types
  ActiveAdmin.routes(self)
  resources :contacts
  devise_for :users
  resources :articles
  resources :franchise_zipcodes
  resources :oncalls
  resources :forms
  resources :vendor_categories
  resources :vendors
  resources :phones
  resources :addresses
  resources :calls
  post 'calls/precall-lookup' => 'calls#precall_lookup'
  post 'calls/precall-webhook' => 'calls#precall'
  post 'calls/postcall-webhook' => 'calls#postcall'
  get 'users/list' => 'users#list'
  resources :users
  resources :states
  resources :agents
  resources :adjusters
  get 'jobs/list' => 'jobs#list'
  get 'jobs/no-activity' => 'jobs#no_activity', as: :jobs_no_activity
  get 'jobs/search' => 'jobs#search', as: :job_search
  get 'jobs/:id/calls' => 'jobs#calls', as: :job_calls
  get 'jobs/:id/calls/new' => 'jobs#add_call', as: :new_job_call
  post 'jobs/:id/calls' => 'jobs#create_call', as: :create_job_call
  resources :insurance_companies
  resources :notes
  get 'job_managers' => 'job_managers#list'

  get 'users/:id/job-assignments' => 'users#job_assignments', as: :user_job_assignents
  get 'users/:id/job-assignments/list' => 'users#job_assignments_list', as: :user_job_assignents_list

  resources :jobs do
    get 'notes' => 'notes#job_notes'
    get 'overview' => 'overview#index', as: :overview
    resources :ticsheets
    resources :properties
    resources :losses
    resources :callers
    resources :occupants
    resources :job_details
    resources :job_managers
    get 'job_managers/:id/acknolwedge' => 'job_managers#acknolwedge'
    resources :vendor_assignments
    resources :contact_assignments
    post 'agents/samecaller' => 'agents#samecaller'
    post 'adjusters/samecaller' => 'adjusters#samecaller'
    resources :emergency_contacts
    post 'emergency_contacts/samecaller' => 'emergency_contacts#samecaller'
    post 'customers/samecaller' => 'customers#samecaller', as: :customer_same_as_caller
    resources :uploads
    get 'job_forms/dowload/:id' => 'job_forms#download'
    resources :job_forms
    get 'job_forms/new/:id' => 'job_forms#new_form', as: :create_form
    resources :work_orders
  end

  resources :customers
  post 'jobs/filter' => 'jobs#filter'
  post 'addresses/geolocate' => 'addresses#geolocate'
  post 'agents/lookup' => 'agents#lookup'
  post 'adjusters/lookup' => 'adjusters#lookup'

  root 'home#index'
end
