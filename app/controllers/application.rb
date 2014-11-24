class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :partial_template_engine, :erb

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, "..", "..", "public") }

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
