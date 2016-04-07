Rpt::Application.routes.draw do
  resources :invitados

  resources :fechas do
    collection { post :import }
  end

  get "errors/sub_layout"
  get "errors/erro_404"
  get "errors/error_422"
  get "errors/error_500"
  get "errors/error_505"
  resources :asignaciones

  resources :actividades

  resources :consultores

  devise_for :consultoras
  resources :proyectos
  resources :customers
  resources :profiles

  get "dashboard/index"
  get "main/index"
  get "perfil_consultoras" => "profiles#index",:as => "Perfil_Consultoras"
  get '/generando_login_consultor/:id', to: 'consultores#register', :as => "register"
  post '/registrar', :to =>  'consultores#register_user'
  get "dashboard" => "dashboard#index",:as => "Dashboard"
  get "clientes" => "customers#index",:as => "Clientes"
  get "clientes", to: "customers#index", :as => "cliente"
  get "/nuevo_cliente", to: "customers#new", :as => "nuevo"
  get "/editando_cliente/:id", to: "customers#edit", :as => "editar"
  get "proyectos" => "proyectos#index",:as => "Proyectos"
  get '/asignaciones_consultor/:id', to: 'consultores#asignar', :as => "asignar"
  get '/consultor/:id', to: 'consultores#edit', :as => "edit"
  post '/asignar', :to =>  'consultores#crear_asignaciones'
  get "/editando_consultor/:id", to: "consultores#edit", :as => "editar_consultor"
  get "/nuevo_consultor", to: "consultores#new", :as => "nuevo_consultor"
  post '/abrir_periodo', :to =>  'actividades#abrir_periodo'
  get '/acceso', to: 'consultores#acceso', :as => "accesso"
  post '/registrar_invitados', :to =>  'consultores#register_invitados'
  post '/acceso', :to =>  'consultores#acceso'
  post '/enviar_email', :to =>  'consultores#enviar_email'

  
#errores
  get "/404", :to => "errors#error_404", via: :all
  get "/422", :to => "errors#error_422", via: :all
  get "/500", :to => "errors#error_500", via: :all
  get "/505", :to => "errors#error_505", via: :all


  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: "dashboard#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
