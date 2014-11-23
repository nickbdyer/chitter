class Chitter
  
  get '/users/new' do
    @user = User.new
    erb :"users/new"
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


end