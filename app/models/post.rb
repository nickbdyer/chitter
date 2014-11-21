class Post

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :author, String
  property :created, Time

end