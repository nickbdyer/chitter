require 'spec_helper'

describe Post do

  it "should be created and then retrieved from the database" do
    expect(Post.count).to eq 0
    Post.create(body: "The bird is the word!", 
                author: "testuser", 
                created_at: Time.now)
    expect(Post.count).to eq 1
    post = Post.first
    expect(post.body).to eq "The bird is the word!"
    expect(post.author).to eq "testuser"
    expect(post.created_at).not_to be nil
    post.destroy
    expect(Post.count).to eq 0 
  end

end