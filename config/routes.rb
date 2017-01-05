Rails.application.routes.draw do

    resources :phones
    resources :addresses
    resources :calls
    post 'calls/precall-lookup' => 'calls#precall_lookup'
    post 'calls/precall-webook' => 'calls#precall'
    post 'calls/postcall-webook' => 'calls#postcall'
    devise_for :users
    resources :users

    resources :jobs do
        resources :properties
        resources :losses
        resources :callers
        resources :occupants
        resources :job_details
        resources :agents
        post 'agents/samecaller' => 'agents#samecaller'
        resources :adjusters
        post 'adjusters/samecaller' => 'adjusters#samecaller'
        resources :emergency_contacts
        post 'emergency_contacts/samecaller' => 'emergency_contacts#samecaller'
        post 'customers/samecaller' => 'customers#samecaller'
        resources :images
    end

    resources :customers



    post 'jobs/filter' => 'jobs#filter'

    post 'addresses/geolocate' =>  "addresses#geolocate"

    root 'home#index'



end
