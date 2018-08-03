Rails.application.routes.draw do
  resources :purchase_requisitions do
  	collection do
  		delete :delete_all
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
