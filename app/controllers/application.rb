class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super iuygyutfyutyutsecret'

  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :partial_template_engine, :erb

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, "..", "..", "public") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
