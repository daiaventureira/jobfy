require 'rails_helper'

RSpec.describe Project, type: :model do
  context "closed?" do
    it "deadline is less than current date" do 
      user = User.create!(email: 'user@user.com.br', password: '123456')
      project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user)
      travel_to(DateTime.tomorrow + 1) do 
        expect(project).to be_closed
      end
    end

      it "project closed by user" do 
        user = User.create!(email: 'asdf@nha.com.br', password: '123456')
        project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user)
        b_date = 18.days.ago
        professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
        Profile.new(full_name: 'Daiane Souza', description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
        project_application = ProjectApplication.new(introduction: 'Hello', professional: professional, project: project)

        closed = project.closed!

        expect(project).to be_closed

    end 
  end
end
