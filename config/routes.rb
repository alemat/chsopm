Rails.application.routes.draw do
  resources :helps
  get 'reports/project_report'
  post 'reports/project_report'
  get 'visualizations/index'
  get 'visualizations/load_sub_focus_areas'
  get 'visualizations/load_projects_by_sub_focus_area'
  get 'visualizations/load_projects_by_focus_area'
  resources :evaluators
  resources :evaluations
  resources :performance_reports
  resources :project_amendments
  resources :implementation_areas
  resources :funders
  resources :projects do
    collection do
      get 'load_sub_focus_areas'
      get 'upcoming_mid_term_evaluations'
      get 'upcoming_end_term_evaluations'
      get 'missed_mid_term_evaluations'
      get 'missed_end_term_evaluations'
      get 'project_by_region'
      get 'projects_by_sub_focus_area'
      get 'projects_by_focus_area'
    end
  end
  resources :reporting_types
  resources :funding_statuses
  resources :project_statuses
  resources :sub_focus_areas
  resources :focus_areas
  resources :institutions
  resources :institution_statuses
  resources :institution_types
  resources :regions
  get 'home/index'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  
    resources :users do
      member do
        get 'confirm'
      end
    end



  resources :users
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
