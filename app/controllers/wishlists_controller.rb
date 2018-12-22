class WishlistsController < ApplicationController

  get '/wishlists' do
    if logged_in?
      erb :'wishlists/wishlists'
    else
      redirect to '/login'
    end
  end


end
