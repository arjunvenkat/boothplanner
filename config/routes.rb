Rails.application.routes.draw do
  resources :taught_bies
  resources :evals
  resources :courses
  resources :instructors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
