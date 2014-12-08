require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative './helpers/application'
require_relative './models/post'
require_relative './models/user'
require_relative 'data_mapper_setup'

require_relative './controllers/application'
require_relative './controllers/homepage'
require_relative './controllers/sessions'
require_relative './controllers/users'


