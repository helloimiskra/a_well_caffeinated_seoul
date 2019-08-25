
require './config/environment'
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "awesomecafes"
  end
  
  
  #register Sinatra::ActiveRecordExtension
  #set :session_secret, "my_application_secret"
  #set :views, Proc.new { File.join(root, "../views/") }


  #get '/' do
   # "hello world"
  #end

  helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You have to be logged in to do that"
      end
    end
    def logged_in?
        !!session[:user_id]
    end
    def current_user
        User.find(session[:user_id])
    end

  end
end


  #register Sinatra::ActiveRecordExtension
   # configure do
   #   set :public_folder, 'public'
    #  set :views, Proc.new { File.join(root, "../views/") }
    #  enable :sessions
    #  set :session_secret, "password_security"
   # end
    #get '/' do
    #   "Hello, World!"
    #end
 # end


#  set :views, Proc.new { File.join(root, "../views/") }