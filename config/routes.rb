Rails.application.routes.draw do

  resources 'backends',only: [:index]
  namespace :backends do
    root to: 'backends#index'

    resource :sessions , only: [:create,:destroy]
    resources :systems,only: %w(edit update)
    resources :exams do
      collection do
        post :sort
      end
    end
    resources :admins do
      collection do
        get :login
      end
    end
  end

  resources 'users' do
    collection do
      post :login
      get :ranking
      post :add_score
      get :check_score
    end
  end

  resources 'exams' do
    collection do
      get :output
      get :print_exam_set
      get :search
    end
  end
  resources 'game_records' do
    collection do
      get :print_record
    end
  end
end
