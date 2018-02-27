# == Route Map
#
#                 Prefix Verb   URI Pattern                       Controller#Action
#     new_author_session GET    /authors/sign_in(.:format)        devise/sessions#new
#         author_session POST   /authors/sign_in(.:format)        devise/sessions#create
# destroy_author_session DELETE /authors/sign_out(.:format)       devise/sessions#destroy
#    new_author_password GET    /authors/password/new(.:format)   devise/passwords#new
#   edit_author_password GET    /authors/password/edit(.:format)  devise/passwords#edit
#        author_password PATCH  /authors/password(.:format)       devise/passwords#update
#                        PUT    /authors/password(.:format)       devise/passwords#update
#                        POST   /authors/password(.:format)       devise/passwords#create
#                   root GET    /                                 blog/posts#index
#          authors_posts GET    /authors/posts(.:format)          authors/posts#index
#                        POST   /authors/posts(.:format)          authors/posts#create
#       new_authors_post GET    /authors/posts/new(.:format)      authors/posts#new
#      edit_authors_post GET    /authors/posts/:id/edit(.:format) authors/posts#edit
#           authors_post GET    /authors/posts/:id(.:format)      authors/posts#show
#                        PATCH  /authors/posts/:id(.:format)      authors/posts#update
#                        PUT    /authors/posts/:id(.:format)      authors/posts#update
#                        DELETE /authors/posts/:id(.:format)      authors/posts#destroy
#                  about GET    /about(.:format)                  blog/pages#about
#                contact GET    /contact(.:format)                blog/pages#contact
#                  posts GET    /posts(.:format)                  blog/posts#index
#                   post GET    /posts/:id(.:format)              blog/posts#show
# 

Rails.application.routes.draw do

  	devise_for :authors
	root to: 'blog/posts#index'

	# /author/posts
	namespace :authors do 
		get '/acount' => 'accounts#edit', as: :account
		put '/info' => 'accounts#update_info', as: :info
		put '/change_password' => 'accounts#change_password', as: :change_password

		resources :posts do
			get 'publish' => 'posts#publish', on: :member, as: :publish
			get 'unpublish' => 'posts#unpublish', on: :member, as: :unpublish
		end
	end

	scope module: 'blog'  do
		get 'about' => 'pages#about', as: :about
		get 'contact' => 'pages#contact', as: :contact		
		get 'posts' => 'posts#index', as: :posts
		get 'posts/:id' => 'posts#show', as: :post
  	end
 	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end