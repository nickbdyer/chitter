require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique => true, :message => "Sorry, your username is already taken."
  property :name, Text
  property :email, Text, :unique => true, :message => "Sorry, this email is already registered."
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end