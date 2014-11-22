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
  use Rack::Flash

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

  post '/users/signin' do
    @user = User.create(username: params[:username], 
                name: params[:name], 
                email: params[:email], 
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      erb :"users/signin"
    else
      flash[:notice] = "Sorry, please make sure your passwords match."
      erb :"users/new"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
