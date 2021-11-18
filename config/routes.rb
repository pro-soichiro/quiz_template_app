Rails.application.routes.draw do

  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
  }

  namespace :admin do
    resources :staffs, only: [:index,:show,:update]
    resources :questions, only: [:index,:new,:create,:edit,:update,:destory]
    resources :categories, only: [:index,:create,:edit,:update,:destory]
    resources :correct_answer_rates, only:[:create]
    resources :achievement_rates, only:[:create,:update]
  end

  devise_for :staffs, skip: [:passwords,] ,controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
  }

  scope module: :public do
    root 'homes#about'
    get 'homes/about'
    resources :staffs, only: [:show,:index,:edit,:update]
    get 'questions/categories'
    resources :questions, only: [:new]
    get 'questions/answer'
    get 'questions/result'
    resources :correct_answer_rates, only: [:index]
  end

end
