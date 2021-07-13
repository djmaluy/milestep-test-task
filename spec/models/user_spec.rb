require 'rails_helper'

RSpec.describe User, type: :model do

  
  user = User.first_or_create!(first_name: "Test", last_name: "Test", 
    email:"test@test.net", password: 'password', password_confirmation: 'password' )
  

  it 'checks that a user can be created' do
    expect(user).to be_valid
  end

  it 'checks that a user can be read' do
    expect(User.find_by_email("test@test.net")).to eq(user)
  end
  
  it 'checks that a user can be updated' do
    user.update(first_name: "AnotherName")
    expect(User.find_by_email("test@test.net")).to eq(user)
  end

  it 'checks that a user has first_name' do
    user.first_name = ""
    expect(user).to_not be_valid
    user.first_name = "SomeText"
    expect(user).to be_valid
  end

  it 'checks that a user has last_name' do
    user.last_name = ""
    expect(user).to_not be_valid
    user.last_name = "SomeText"
    expect(user).to be_valid
  end

  it 'checks that a user has email' do
    user.email = ""
    expect(user).to_not be_valid
    user.email = "someEmail@test.com"
    expect(user).to be_valid
  end

end