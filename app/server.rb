require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './app/models/post'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!


class Chitter < Sinatra::Base
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
    erb :"users/new"
  end

  post '/users/signin' do
    User.create(username: params[:username], 
                name: params[:name], 
                email: params[:email], 
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    erb :"users/signin"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
