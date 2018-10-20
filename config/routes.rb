Rails.application.routes.draw do
  root to: "purchase_requisitions#index"
  get 'authorize' => 'auth#gettoken'
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :purchase_requisitions do
  	collection do
  		delete :delete_all
      get :sample
      get :mail
    end
  end
  resources :petty_cash_records
  resources :employees do
  	resources :remit_infos, module: :employees
  end
  resources :companies do
  	resources :remit_infos, module: :companies
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
