require 'rails_helper'

describe "User creates project" do 
  it "successfully" do 
    user = User.create!(email: 'user@user.com.br', password: '123456')

    login_as user, scope: :user 

    visit root_path
    deadline = 2.days.from_now
    click_on "Adicionar projeto"

    fill_in "Título:", with: "Projeto"
    fill_in "Descrição:", with: "Descrição de um projeto"
    fill_in "Habilidades:", with: "Habilidades de um profissional"
    fill_in "Data limite:", with: deadline 
    fill_in "Preço por hora:", with: 230

    click_on 'Adicionar'
    visit root_path 
    
    expect(page).to have_content("Jobfy")
    expect(page).to have_content("Título: Projeto")
    expect(page).to have_content("Descrição: Descrição de um projeto")
    expect(page).to have_content("Habilidades: Habilidades de um profissional")
    expect(page).to have_content("Data limite: #{deadline.strftime("%d/%m/%Y")}")
    expect(page).to have_link("Encerrar inscrições")
  end
  it "and closes applications for that project" do 
    user = User.create!(email: 'user@user.com.br', password: '123456')
    project = Project.create!(title: "Projeto", description: "Descrição de um projeto", skills: "Habilidades de um profissional", deadline: 2.days.from_now, price_per_hour: 230, user: user  )
    
    login_as user, scope: :user 

    visit root_path

    click_on "Encerrar inscrições"

    expect(page).to have_link("Encerradas")
  end
  it "and sees aplications" do 
    user = User.create!(email: 'user@user.com.br', password: '123456')
    project = Project.create!(title: "Projeto", description: "Descrição de um projeto", skills: "Habilidades de um profissional", deadline: 2.days.from_now, price_per_hour: 230, user: user  )
    
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
    attach_file('Foto', "#{Rails.root}/spec/fixtures/picture.jpg")

    click_on "Criar"
    click_on "Ver projetos disponíveis"
    click_on "Projeto"

    fill_in "Introdução", with: "Ola quero me candidatar"
    click_on "Candidatar-se"
    click_on "Logout"

    login_as user, scope: :user

    visit root_path

    click_on "Ver aplicações"

    expect(page).to have_content("Introdução")
    expect(page).to have_content("Ola quero me candidatar")
    expect(page).to have_content("Nome do profissional")
    expect(page).to have_content("Joao")
  end
end


