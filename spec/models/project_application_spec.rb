require 'rails_helper'

RSpec.describe ProjectApplication, type: :model do
  it "project rejected by user " do
    user = User.create!(email: 'asdf@nha.com.br', password: '123456')
    project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user)
    b_date = 18.years.ago
    professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
    Profile.new(full_name: 'Daiane Souza', description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
    project_application = ProjectApplication.new(introduction: 'Hello', professional: professional, project: project)

    reject = project_application.rejected!

    expect(project_application).to be_rejected
  en

  it "project pending" do
    user = User.create!(email: 'asdf@nha.com.br', password: '123456')
    project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user)
    b_date = 18.years.ago
    professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
    Profile.new(full_name: 'Daiane Souza', description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
    project_application = ProjectApplication.new(introduction: 'Hello', professional: professional, project: project)

    pending = project_application.pending!

    expect(project_application).to be_pending
  end

  it "project accepted by user" do
    user = User.create!(email: 'asdf@nha.com.br', password: '123456')
    project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user)
    b_date = 18.days.ago
    professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
    Profile.new(full_name: 'Daiane Souza', description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
    project_application = ProjectApplication.new(introduction: 'Hello', professional: professional, project: project)

    accepted = project_application.accepted!

    expect(project_application).to be_accepted
  end
end
