require 'spec_helper'

describe User do
  before do
    @user = User.new(username: "pmnhatdn", email: "pmnhatdn@gmail.com", 
                     password: "pmnhatdn", password_confirmation: "pmnhatdn")
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  
  it { should respond_to(:password_confirmation) }
   describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end
end
