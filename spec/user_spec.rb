require 'spec_helper'

describe User do

  it "should be created and then retrieved from the database" do
    expect(User.count).to eq 0
    User.create(username: "testuser", 
                name: "Testy McTesterson", 
                email: "test@example.com",
                password: "secret",
                password_confirmation: "secret")
    expect(User.count).to eq 1
    user = User.first
    expect(user.username).to eq "testuser"
    expect(user.name).to eq "Testy McTesterson"
    expect(user.email).to eq "test@example.com"
    expect(user.password_digest).not_to be nil
    user.destroy
    expect(User.count).to eq 0 
  end

  it "should not be created if password does not match password confirmation" do
    expect(User.count).to eq 0
    User.create(username: "testuser", 
                name: "Testy McTesterson", 
                email: "test@example.com",
                password: "secret",
                password_confirmation: "s3cr3t")
    expect(User.count).to eq 0 
  end

end