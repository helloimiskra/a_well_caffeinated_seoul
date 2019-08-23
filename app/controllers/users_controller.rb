class UsersController < ApplicationController

    get '/' do
        erb :'/index'
       end
   
       get '/signup' do
           erb :'/users/create_user'
       end
   
       post '/signup' do
           user = User.new(username: params[:username], password: params[:password])
   
           if user.save
               redirect '/cafes'
           else
               redirect '/signup'
           end
       end
   
       get '/login' do
           erb :'/users/login'
       end
   
       post '/login' do
           user = User.find_by(username: params[:username])
   
           if user && user.authenticate(params[:password])
               session[:user_id] = user.user_id
               redirect '/cafes'
           else
               redirect '/login'
           end
       end
   
   
       get 'users/:id/' do
           user = User.find(session[:user_id])
           erb :/
       end
   
       get '/failure' do
           erb :'/users/failure'
       end
   
       get '/logout' do
           session.clear
           redirect '/'
       end
   
       




end