require 'rails_helper'

describe "Professional Authentication" do 
  it "cannot create profile if is not logged in" do 
    post "/professionals/1/profiles/" 

    expect(response).to redirect_to(new_professional_session_path)
  end 

  it "cannot see profile if is not logged" do 
    get "/professionals/1/profiles/1"

    expect(response).to redirect_to(new_professional_session_path)
  end 

  it "cannot update profile if is not logged in" do 
    patch "/profiles/1" 

    expect(response).to redirect_to(new_professional_session_path)
  end 

  it "cannot create project application if not logged in" do
    post "/projects/1/project_applications"

    expect(response).to redirect_to(new_professional_session_path)
  end

  it "cannot see show of project application if not logged in" do
    get "/project_applications/1"

    expect(response).to redirect_to(new_professional_session_path)
  end

  it "cannot update project application if not logged in" do
    patch "/project_applications/1"

    expect(response).to redirect_to(new_professional_session_path)
  end  

  it "cannot destroy project application if not logged in" do
    delete "/project_applications/1"

    expect(response).to redirect_to(new_professional_session_path)
  end  
end 
