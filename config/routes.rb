Rails.application.routes.draw do
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
  devise_for :users
  resources :users
  resources :states
  resources :agents
  resources :adjusters
  get 'jobs/list' => 'jobs#list'
  get 'jobs/search' => 'jobs#search', as: :job_search
  get 'jobs/:id/calls' => 'jobs#calls', as: :job_calls
  get 'jobs/:id/calls/new' => 'jobs#add_call', as: :new_job_call
  post 'jobs/:id/calls' => 'jobs#create_call', as: :create_job_call
  resources :insurance_companies
  resources :notes

  resources :jobs do
    get 'notes' => 'notes#job_notes'
    get 'overview' => 'overview#index', as: :overview
    resources :properties
    resources :losses
    resources :callers
    resources :occupants
    resources :job_details
    resources :job_managers
    resources :vendor_assignments
    post 'agents/samecaller' => 'agents#samecaller'
    post 'adjusters/samecaller' => 'adjusters#samecaller'
    resources :emergency_contacts
    post 'emergency_contacts/samecaller' => 'emergency_contacts#samecaller'
    post 'customers/samecaller' => 'customers#samecaller', as: :customer_same_as_caller
    resources :uploads
    get 'job_forms/dowload/:id' => 'job_forms#download'
    resources :job_forms
    get 'job_forms/new/:id' => 'job_forms#new_form', as: :create_form
  end

  resources :customers
  post 'jobs/filter' => 'jobs#filter'
  post 'addresses/geolocate' => 'addresses#geolocate'
  post 'agents/lookup' => 'agents#lookup'
  post 'adjusters/lookup' => 'adjusters#lookup'

  root 'home#index'
end
