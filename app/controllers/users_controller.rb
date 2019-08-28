class UsersController < ApplicationController

    get '/' do
        erb :'/index'
       end
   
       get '/signup' do
           erb :'/users/new'
       end
   
       post '/signup' do
            if taken?(params[:username])
                redirect '/username-error'
            else
                @user = User.create(username: params[:username], email: params[:email], password: params[:password])
            end
   
           if @user.save
               redirect '/login'
           else
               redirect '/signup'
           end
       end
   
       get '/login' do
            if !session[:user_id]
            erb :'/users/login'
            end
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
       
       get '/username-error' do
        erb :'/users/username_error'
       end
       
       def taken?(username)
        !User.find_by(username: username).nil?
       end
        
    


end