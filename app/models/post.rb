class Post

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :author, String
  property :created_at, Time
  property :user_id, Integer

  belongs_to :user

end