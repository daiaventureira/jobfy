require 'rails_helper'

describe "User Authentication" do 
  it "cannot create project if is not logged in" do 
    post "/projects"

    expect(response).to redirect_to(new_user_session_path)
  end 

  it "cannot open new project if is not logged" do 
    get "/projects/new"

    expect(response).to redirect_to(new_user_session_path)
  end 
end 
