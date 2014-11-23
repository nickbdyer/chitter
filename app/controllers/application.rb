class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  set :views, Proc.new { File.join(root, "..", "views") }

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
