require 'spec_helper'
class Plane
end

describe User do

   let(:plane) { Plane.new }

  it "should be created and then retrieved from the database" do
    puts '====' * 20
    puts plane.inspect
    expect(User.count).to eq 0
    create_user
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
    puts '====' * 20
    puts plane.inspect
    expect(User.count).to eq 0
    User.create(username: "testuser", 
                name: "Testy McTesterson", 
                email: "test@example.com",
                password: "secret",
                password_confirmation: "s3cr3t")
    expect(User.count).to eq 0 
  end

  it "should not be created if the username is not unique" do
    puts '====' * 20
    puts plane.inspect
    create_user
    expect(User.count).to eq 1
    User.create(username: "testuser", 
                name: "Testy McTesterson", 
                email: "supertest@example.com",
                password: "secret",
                password_confirmation: "secret")
    expect(User.count).to eq 1 
  end

  it "should not be created if the username is not unique" do
    create_user
    expect(User.count).to eq 1
    User.create(username: "supertestuser", 
                name: "Testy McTesterson", 
                email: "test@example.com",
                password: "secret",
                password_confirmation: "secret")
    expect(User.count).to eq 1 
  end


end