Chiscore::Application.routes.draw do
  get "user_sessions/new"

  resources :checkpoints
  resources :teams
  resources :team_checkins
  resources :user_sessions
  resources :prize_categories do
    collection do
      get :tally
      post :cast_votes
    end
    resources :votes do
    end
  end

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout


  match "main/checkout/:team_checkin_id" => "main#checkout", :as => "checkout"
  match "main/set_checkpoint" => "main#set_checkpoint"
  match "main/change_checkpoint" => "main#change_checkpoint", :as => "change_checkpoint"
  match "main/checkin" => "main#checkin", :as => "checkin"
  match "main/checkins" => "main#checkins", :as => "checkins"
  match "main/totals" => "main#totals", :as => 'totals'
  match "main/timer_totals" => "main#timer_totals", :as => 'timer_totals'
  match "main/reload_checkins" => "main#reload_checkins"
  match "main/start_race" => "main#start_race", :as => "start_race"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "main#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
