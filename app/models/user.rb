require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique => true, :message => "Sorry, the username you entered is already taken."
  property :name, Text
  property :email, Text, :unique => true, :message => "Sorry, the email you entered is already registered."
  property :password_digest, Text

  has n, :posts

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"
  validates_format_of :email, :as => :email_address



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end