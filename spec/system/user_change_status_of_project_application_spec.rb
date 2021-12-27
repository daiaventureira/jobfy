require 'rails_helper'

describe "User change status of project aplication" do
  it "to accepted" do
    user = User.create!(email: 'user@user.com.br', password: '123456')
    project = Project.create!(title: "Projeto", description: "Descrição de um projeto", skills: "Habilidades de um profissional", deadline: 2.days.from_now, price_per_hour: 230, user: user, remote: false )

    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    date = '27/04/1997'

    login_as professional, scope: :professional
    visit root_path

    click_on 'Crie'

    fill_in 'Nome completo', with: 'Joao'
    fill_in 'Data de nascimento', with: date
    fill_in 'Descrição', with: 'Olá essa é minha descriçao'
    fill_in 'Formação', with: 'Olá essa é minha formação'
    fill_in 'Experiência em anos', with: '2'

    click_on "Criar"
    click_on "Ver projetos disponíveis"
    click_on "Projeto"

    fill_in "Introdução", with: "Ola quero me candidatar"
    click_on "Candidatar-se"
    click_on "Logout"

    login_as user, scope: :user

    visit root_path

    click_on "Ver aplicações"
    click_on "Aceitar"

    expect(page).to have_content("Você aceitou a proposta!")
    expect(page).to have_content('Status: accepted')
  end

  it "to rejected" do
    user = User.create!(email: 'user@user.com.br', password: '123456')
    project = Project.create!(title: "Projeto", description: "Descrição de um projeto", skills: "Habilidades de um profissional", deadline: 2.days.from_now, price_per_hour: 230, remote: false, user: user  )

    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    date = '27/04/1997'

    login_as professional, scope: :professional
    visit root_path
    click_on 'Crie'

    fill_in 'Nome completo', with: 'Joao'
    fill_in 'Data de nascimento', with: date
    fill_in 'Descrição', with: 'Olá essa é minha descriçao'
    fill_in 'Formação', with: 'Olá essa é minha formação'
    fill_in 'Experiência em anos', with: '2'

    click_on "Criar"
    click_on "Ver projetos disponíveis"
    click_on "Projeto"
    fill_in "Introdução", with: "Ola quero me candidatar"
    click_on "Candidatar-se"
    click_on "Logout"
    login_as user, scope: :user
    visit root_path
    click_on "Ver aplicações"
    click_on "Recusar"

    expect(page).to have_content("Você recusou a proposta!")
    expect(page).to have_content('Status: rejected')
  end
end

