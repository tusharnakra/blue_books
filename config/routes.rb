BlueBooks::Application.routes.draw do
  
  resources :send_documents


  get "books/index"

  get "books/new"

  get "books/create"

  get "books/destroy"

  #devise_for :users

  #root :to => 'documents#index'
  root :to => 'members#admin_home_page'

  #match 'documents/show_pdf/:id' => 'documents#show_pdf', :as => 'show_pdf' 
  #resources :documents
  #match '/download/:id' => 'documents#download', :as => 'download'
 
  match 'groups/showMembersInGroup/:id' => "groups#showMembersInGroup", :as => 'showMembersInGroup'
  resources :groups


  resources :schools

  match 'members/admin_home_page' => "members#admin_home_page"
  resources :members
  get 'search' => "members#search"
  
  
  resources :request_accesses
  
  # Added for carrierwave-aditya
  match 'books/showBook_pdf/:id' => 'books#showBook_pdf', :as => 'showBook_pdf'
  resources :books, only: [:index, :new, :create, :destroy]
  get 'book_search' => "books#book_search"  
  match '/download_book/:id' => 'books#download_book', :as => 'download_book'
  
  
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
  #root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
