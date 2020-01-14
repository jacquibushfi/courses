Rails.application.routes.draw do

  get 'enrollments/new'
  get 'enrollments/show'
  get 'enrollments/index'
  get 'enrollments/edit'
  get 'courses/new'
  get 'courses/index'
  get 'courses/show'
  root to: 'application#welcome'
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new' 
    get 'signup', to: 'devise/registrations#new'
    
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
