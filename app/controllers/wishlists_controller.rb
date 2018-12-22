class WishlistsController < ApplicationController
belongs_to :user

  get '/wishlists' do
    if logged_in?
      erb :'wishlists/wishlists'
    else
      redirect to '/login'
    end
  end

  get '/wishlists/new' do
    if logged_in? do
      erb :'/wishlists/new'
    else
      redirect to '/login'
    end
  end

  post '/wishlists' do
    if params[:list_content] == ""
      redirect to '/wishlists/new'
    else
    @wishlist = Wishlist.create(params)
  end

  end


end
