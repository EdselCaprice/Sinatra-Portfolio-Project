class WishlistsController < ApplicationController


  get '/wishlists' do
    redirect_if_not_logged_in
    erb :'wishlists/wishlists'
  end

  get '/wishlists/new' do
    if logged_in?
      erb :'/wishlists/new'
    else
      redirect to '/login'
    end
  end

  get '/wishlists/:id' do
    if logged_in?
      @wishlist = Wishlist.find_by_id(params[:id])
      erb :'/wishlists/show_wishlist'
    end
  end

  get '/wishlists/:id/edit' do
    if logged_in?
      @wishlist = Wishlist.find_by_id(params[:id])
      erb :'/wishlists/edit_wishlist'
    else
      redirect to '/login'
  end
end

  post '/wishlists' do
  if logged_in?
    if params[:list_content] == ""
      redirect to '/wishlists/new'
    else
      @wishlist = Wishlist.create(params)
      @wishlist.user_id = current_user.id
      @wishlist.save
      redirect to "/wishlists/#{@wishlist.id}"
      end
    else
      redirect to '/login'
    end
  end


  patch '/wishlists/:id' do
    if logged_in?
      if params[:list_content] == ""
        redirect to "/wishlists/#{params[:id]}/edit"
      else
        @wishlist = Wishlist.find_by_id(params[:id])
        if @wishlist && @wishlist.user == current_user
          if @wishlist.update(list_content: params[:list_content]) && @wishlist.update(giftee: params[:giftee])
            redirect to "/wishlists/#{@wishlist.id}"
          else
            redirect to "/wishlists/#{@wishlist.id}/edit"
          end
        else
          redirect to '/wishlists'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/wishlists/:id/delete' do
    if logged_in?
      @wishlist = Wishlist.find_by_id(params[:id])
      if @wishlist && @wishlist.user == current_user
        @wishlist.delete
      end
      redirect to '/wishlists'
    else
      redirect to '/login'
    end
  end


end
