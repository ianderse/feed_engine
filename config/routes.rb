Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index', as: dashboard_path

  
end
