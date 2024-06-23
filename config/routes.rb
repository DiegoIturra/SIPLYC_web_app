Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post 'login' => 'login#login'

  # Defines the root path route ("/")
  resources :roles, :users, :cities, 
            :age_ranges, :tablets, :activities, 
            :exercises, :activity_sessions, :activity_exercises

  resources :teacher_students, :kinder_gardens, :students, :teachers do
    collection do
      get 'paginated'
    end
  end

  resources :sessions do
    collection do
      get 'teacher/:teacher_id', to: 'sessions#find_by_teacher', as: 'find_by_teacher'
      get 'teacher/:teacher_id/paginated', to: 'sessions#paginated', as: 'paginated'
    end
  end

  resources :process_files do
    collection do
      post 'process_excel_file'
    end
  end
  
end
