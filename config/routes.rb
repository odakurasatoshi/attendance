Rails.application.routes.draw do
  get 'teachers/index'
  root 'students#show'
  devise_for :teachers, controllers: {
  	sessions: 'teachers/sessions',
  	passwords: 'teachers/passwords',
  	registrations: 'teachers/registrations'
  }

  devise_for :students, controllers: {
  	sessions: 'students/sessions',
  	passwords: 'students/passwords',
  	registrations: 'students/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
