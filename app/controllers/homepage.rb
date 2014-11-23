class Chitter

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

end