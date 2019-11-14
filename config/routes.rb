Rails.application.routes.draw do
  get 'doses/new'
  get 'doses/create'
  get 'doses/destroy'
  get 'new/create'
  get 'new/destroy'
  get 'cocktails/index'
  get 'cocktails/show'
  get 'cocktails/new'
  get 'cocktails/create'
  get 'cocktails/edit'
  get 'cocktails/update'
  get 'cocktails/destroy'
  get 'cocktails/cocktail_params'
  get 'cocktails/set_cocktail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [ :new, :create ]
  end
end

# so this is the nesting of the routes - only the new and create routes are nested.
