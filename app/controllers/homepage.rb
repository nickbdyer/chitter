class Chitter

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/' do
    Post.create(body: params[:body],
                author: current_user.username, 
                created_at: Time.now,
                user_id: session[:user_id])
    @posts = Post.all
    erb :index
  end

end