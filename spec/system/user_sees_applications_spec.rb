require 'rails_helper'

describe 'User sees applications' do
  it 'successfully' do
    user = User.create!(email: 'user@gmail.com.br', password: '123456')
    projeto = Project.new(title: 'Website', description: 'descricao', skills: 'skills', price_per_hour: 'R$ 90,00', deadline: 1.day.ago, user: user )

    login_as user, scope: :user

    visit root_path
    click_on 'Ver aplicações'

    expect(page).to have_current_path('/project_applications')
    expect(page).to have_content('Candidaturas')
  end

  it 'and accepts request' do
    user = User.create!(email: 'user@user.com.br', password: '123456')
    project = Project.new(title: 'web', description: 'descricao', skills: 'skills', price_per_hour: 'R$ 90,00', deadline: 2.days.from_now, remote: true, user: user )

    professional = Professional.new(email: 'pro@fissional.com.br', password: '123456')
    profile = Profile.new(full_name: 'Isa Manueli', birth_date: "27/04/1997", description: "oi eu sou a iza", educational_background: "Artes", experience: '2', professional: professional)
    ProjectApplication.create!(introduction: "Oi quero participar", professional: professional, project: project )

    login_as user, scope: :user

    visit project_applications_path
    click_on "Aceitar"

    expect(page).to have_content("Isa Manueli")
    expect(page).to have_content("Status: accepted")
    expect(page).to_not have_link("Aceitar")
    expect(page).to_not have_link("Recusar")
  end

  it 'and rejects request' do
    user = User.create!(email: 'user@user.com.br', password: '123456')
    project = Project.new(title: 'web', description: 'descricao', skills: 'skills', price_per_hour: 'R$ 90,00', deadline: 2.days.from_now, remote: true, user: user )

    professional = Professional.new(email: 'pro@fissional.com.br', password: '123456')
    profile = Profile.new(full_name: 'Isa Manueli', birth_date: "27/04/1997", description: "oi eu sou a iza", educational_background: "Artes", experience: '2', professional: professional)
    ProjectApplication.create!(introduction: "Oi quero participar", professional: professional, project: project )

    login_as user, scope: :user

    visit project_applications_path
    click_on "Recusar"

    expect(page).to have_content("Isa Manueli")
    expect(page).to have_content("Status: rejected")
    expect(page).to_not have_link("Aceitar")
    expect(page).to_not have_link("Recusar")
  end
end
