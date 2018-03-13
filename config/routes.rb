Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :purchase_requisitions
  resources :petty_cash_records
end
