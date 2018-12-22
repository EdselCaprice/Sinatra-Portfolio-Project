class UsersController < ApplicationController

 get '/signup' do
  if logged_in?
   redirect to '/wishlists'
  else
    erb :'/users/create_user'
  end
 end

 post '/signup' do
   if params[:username] == "" || params[:email] == "" || params[:password_digest] == ""
     redirect to '/signup'
   else
     user = User.create(params)
     session[:user_id] = user.id
     redirect to '/wishlists'
   end
 end


end
