require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

env = ENV['RACK_ENV'] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './app/models/post'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride


  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/' do
    Post.create(body: params[:body],
                author: "Current User", 
                created_at: Time.now)
    @posts = Post.all
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  get '/sessions/new' do
    @user = User.new
    erb :"sessions/new"
  end

  post '/users' do
    @user = User.create(username: params[:username], 
                        name: params[:name], 
                        email: params[:email], 
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      erb :"sessions/new"
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      erb :"sessions/new"
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = "Goodbye"
    redirect to('/')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
