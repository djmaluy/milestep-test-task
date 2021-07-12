# require 'spec_helper'

  RSpec.describe User, type: :model do
    before(:all) do
      @user = User.create(first_name: "Test", last_name: "Test", email:"test@test.net", password_digest: 222, email_confirmed: false)
  end
  

    it 'checks that a user can be created' do
      expect(@user).to be_valid
    end
 
end

