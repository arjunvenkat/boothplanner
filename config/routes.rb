Rails.application.routes.draw do
  devise_for :users
  root to: "course_by_profs#index"
  resources :sections
  resources :teachings
  resources :course_by_profs
  resources :courses
  resources :instructors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
