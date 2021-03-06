
require './config/environment'
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "awesomecafes"
  end
  
  get '/error' do
    erb :error
  end

  helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/error'
      end
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    def own_cafe?(cafe)
      redirect_if_not_logged_in
      redirect '/error' if !cafe
      redirect '/error' if current_user != cafe.user
    end
  end
end
