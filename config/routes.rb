Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :project_amendments
  resources :performance_reports
  resources :evaluations
  resources :project_evaluation_types
  resources :implementation_areas
  resources :funders
  resources :projects
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

  scope "/admin" do
    resources :users do
      member do
        get 'confirm'
      end
    end
  end


  resources :users
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
