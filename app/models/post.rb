class Post

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :author, String
  property :created_at, Time

  # belongs_to :user

end