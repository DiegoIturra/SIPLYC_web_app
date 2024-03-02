Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :roles, :users, :cities, :kinder_gardens, :teachers, :students, :age_ranges

  resources :process_files do
    collection do
      post 'process_excel_file'
    end
  end
  
end
