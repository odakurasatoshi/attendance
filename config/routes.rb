Rails.application.routes.draw do

   devise_for :teachers, controllers: {
    sessions: 'teachers/sessions',
    passwords: 'teachers/passwords',
    registrations: 'teachers/registrations'
  }
  get 'teachers/index'

  namespace :teachers do
    resources :lessons, only: [:index, :new, :edit, :create, :update]
    resources :area_classes, only: [:index, :create, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :courses, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :students, controllers: {
  	sessions: 'students/sessions',
  	passwords: 'students/passwords',
  	registrations: 'students/registrations'
  }

  namespace :students do
      resources :lessons, only: [:index, :show]
      resources :attendees, only: [:index, :show, :create]
  end
  resources :students, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
