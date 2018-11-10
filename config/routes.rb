Rails.application.routes.draw do
  resources :evals
  resources :taught_bies
  resources :courses
  resources :instructors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
