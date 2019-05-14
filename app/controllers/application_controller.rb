class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "auh_demo"
  end

  def login(email, password)
    user = User.find_by(:email => email)
    if user && user.authenticate(password)
      session[:email] = user.email
    else
      redirect '/login'
    end
  end

  def logged_in?
    # using double negation operator takes an object and converts from actual value and casts it as binary of true or false.
    current_user
  end

  def logout!
    "Logged out"
    session.clear
  end

  def current_user
    @current_user ||= User.find_by(:email => session[:email]) if session[:email]
  end
end
