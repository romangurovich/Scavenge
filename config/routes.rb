Scavenge::Application.routes.draw do
  scope "api" do
    resources :treasures
  end
  
  root to: 'main#index'
  get '*path', to: 'main#index'
end
