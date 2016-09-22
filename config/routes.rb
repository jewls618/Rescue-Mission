Rails.application.routes.draw do
  root "questions#index"
  resources :questions do
    resources :answers, only: [:index, :new, :create, :show]
  end

  resources :answers, only: [:show]

  get 'answers/bestanswer', to: 'answer#bestanswer'
end
