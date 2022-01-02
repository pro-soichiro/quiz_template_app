Rails.application.routes.draw do
  devise_for :admin, skip: [:passwords], controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    resources :staffs, only: [:index, :show, :update]
    resources :questions, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
    resources :correct_answer_rates, only: [:create]
    resources :achievement_rates, only: [:create, :update]
  end

  devise_for :staffs, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
  }

  scope module: :public do
    root 'homes#about'
    get 'homes/about'
    get 'staffs/wrong_answer'
    resources :staffs, only: [:show, :edit, :update]
    resources :questions, only: [:new] do
      collection do
        get 'categories'
        post "start"
        get 'answer'
        post 'answer'
        post 'sub_result'
        get 'result'
      end
    end
    resources :achievement_rates, only: [:create, :update]
    get 'correct_answer_rates/index', as: 'correct_answer_rates'
    post 'correct_answer_rates/index'
  end
end
