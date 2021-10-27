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
  end
end
