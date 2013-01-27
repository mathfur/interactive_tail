InteractiveTail::Application.routes.draw do
  resources :log_files
  resources :logs do
    collection do
      get :index_grouped_by_tags
    end
  end
end
