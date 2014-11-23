class Chitter

  get '/sessions/new' do
    @user = User.new
    erb :"sessions/new"
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

end