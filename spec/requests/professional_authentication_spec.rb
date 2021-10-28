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

  it "cannot reject applications" do
    post  "/project_applications/1/reject"

    expect(response).to redirect_to(new_user_session_path)
  end

  it "cannot accept applications" do
    post "/project_applications/1/accept"

    expect(response).to redirect_to(new_user_session_path)
  end

  it "project application cannot be accepted by professional" do 
    user_a = User.create!(email: 'user@a.com.br', password: '123456')
    user_b = User.create!(email: 'user@b.com.br', password: '123456')

    project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user_a)
    b_date = 18.years.ago
    professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
    Profile.new(full_name: 'Daiane Souza', description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
    project_application = ProjectApplication.create!(introduction: 'Hello', professional: professional, project: project)    
  
    login_as professional, scope: :professional
    post "/project_applications/#{project_application.id}/accept"

    expect(response).to redirect_to("/users/sign_in")
  end

  it "project application cannot be rejected by professional" do 
    user_a = User.create!(email: 'user@a.com.br', password: '123456')
    user_b = User.create!(email: 'user@b.com.br', password: '123456')

    project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user_a)
    b_date = 18.years.ago
    professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
    Profile.new(full_name: 'Daiane Souza', description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
    project_application = ProjectApplication.create!(introduction: 'Hello', professional: professional, project: project)    
  
    login_as professional, scope: :professional
    post "/project_applications/#{project_application.id}/reject"

    expect(response).to redirect_to("/users/sign_in")
  end
end 
