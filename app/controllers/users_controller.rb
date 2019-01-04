class UsersController < ApplicationController

 get '/signup' do
  if logged_in?
   redirect to '/wishlists'
  else
    erb :'/users/create_user'
  end
 end

 get '/user/show' do
   @user = User.find_by_id(current_user.id)
   erb :'/users/show'
 end

 get '/login' do
   if logged_in?
     redirect to '/wishlists'
   else
     erb :'/users/login'
   end
 end

 post '/signup' do
   if params[:username] == "" || params[:email] == "" || params[:password] == "" || !!User.find_by(:username => params[:username]) == true || !params[:email].include?("@")
     redirect to '/signup'
   else
     user = User.create(params)
     session[:user_id] = user.id
     redirect to '/wishlists'
   end
 end

 post '/login' do
   @user = User.find_by(:Username => params[:username])
   if @user && @user.authenticate(params[:password])
   #if @user.password_digest == params[:password_digest]
     session[:user_id] = @user.id
     erb :'/users/show'
   else
     redirect to '/login'
   end
 end

 get '/logout' do
   if logged_in?
     session.destroy
     redirect to '/login'
   else
     redirect to '/login'
   end
  end






end
