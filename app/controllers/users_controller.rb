class UsersController < ApplicationController

    get '/' do
        erb :'/index'
       end
   
       get '/signup' do
           erb :'/users/create_user'
       end
   
       post '/signup' do
           @user = User.create(username: params[:username], email: params[:email], password: params[:password])
   
           if @user.save
               redirect '/login'
           else
               redirect '/signup'
           end
       end
   
       get '/login' do
           erb :'/users/login'
       end
   
       post '/login' do
           @user = User.find_by(username: params[:username])
   
           if @user && @user.authenticate(params[:password])
               session[:user_id] = @user.id
               redirect '/cafes/new'
           else
               redirect '/login'
           end
       end
   
   
       get '/users/:id/' do
           user = User.find(session[:user_id])
           erb :/
       end
   
   
       get '/logout' do
        if session[:user_id] != nil
           session.destroy
           redirect '/login'
        else
            redirect '/'
        end
       end
   
       




end