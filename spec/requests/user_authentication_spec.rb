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

  it "project application cannot be rejected by other user than its owner" do 
    user_a = User.create!(email: 'user@a.com.br', password: '123456')
    user_b = User.create!(email: 'user@b.com.br', password: '123456')

    project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user_a)
    b_date = 18.years.ago
    professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
    Profile.new(full_name: 'Daiane Souza', description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
    project_application = ProjectApplication.create!(introduction: 'Hello', professional: professional, project: project)    
  
    login_as user_b, scope: :user
    post "/project_applications/#{project_application.id}/reject"

    expect(response).to redirect_to(project_applications_path)
    expect(flash[:notice]).to eq("Você não tem privilégios para executar essa ação!")
  end

  it "project application cannot be accepted by other user than its owner" do 
    user_a = User.create!(email: 'user@a.com.br', password: '123456')
    user_b = User.create!(email: 'user@b.com.br', password: '123456')

    project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user_a)
    b_date = 18.years.ago
    professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
    Profile.new(full_name: 'Daiane Souza', description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
    project_application = ProjectApplication.create!(introduction: 'Hello', professional: professional, project: project)    
  
    login_as user_b, scope: :user
    post "/project_applications/#{project_application.id}/accept"

    expect(response).to redirect_to(project_applications_path)
    expect(flash[:notice]).to eq("Você não tem privilégios para executar essa ação!")
  end
end 
