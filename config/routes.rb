Rails.application.routes.draw do

  namespace :admin do
    get 'staffs/top'
    get 'staffs/show'
    get 'staffs/update'

    get 'questions/index'
    get 'questions/new'
    get 'questions/create'
    get 'questions/edit'
    get 'questions/update'
    get 'questions/destroy'

    get 'achievement_rates/create'
    get 'achievement_rates/update'

    get 'correct_answer_rates/create'

    get 'categories/index'
    get 'categories/create'
    get 'categories/edit'
    get 'categories/update'


  end
  root to: "public/homes#about"
  namespace :public do
    get 'homes/about'
    root to: "homes#about"

    get 'correct_answer_rates/index'

    get 'questions/categories'
    get 'questions/new'
    get 'questions/answer'
    get 'questions/result'

    get 'staffs/show'
    get 'staffs/index'
    get 'staffs/edit'
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
