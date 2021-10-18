require "rails_helper"

describe 'Professional fill profile when authenticated' do 
  it "successfully" do 

    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    date = '27/04/1997'

    login_as professional, scope: :professional
    visit root_path

    click_on 'Crie'
    
    fill_in 'Nome completo', with: 'Daiane Souza'
    fill_in 'Nome social', with: 'Dai'
    fill_in 'Data de nascimento', with: date
    fill_in 'Descrição', with: 'Olá essa é minha descriçao'
    fill_in 'Formação', with: 'Olá essa é minha formação'
    fill_in 'Experiência em anos', with: '2'
    attach_file('Foto', "#{Rails.root}/spec/fixtures/picture.jpg")

    click_on "Criar"

    visit root_path

    expect(page).to have_content('Daiane Souza')
    expect(page).to have_content('Dai')
    expect(page).to have_content('Olá essa é minha descriçao')
    expect(page).to have_content('Olá essa é minha formação')
    expect(page).to have_content(27/04/1997)
    expect(page).to have_content(/2/)
    expect(page).to have_css("img[alt=Foto]")
  end

  it "and should complete profile fullfillment before see projects" do 
    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    
    login_as professional, scope: :professional 
    visit root_path

    expect(page).to have_content("You need to complete your profile before see projects")
    expect(page).to have_link('Crie')
    expect(page).to_not have_link('Veja seu perfil')
  end

  # it "and navigate successfully" do

  #   professional = Professional.create!(email: 'user@user.com.br', password: '123456')
  #   foto = attach_file('Foto', "#{Rails.root}/spec/fixtures/picture.jpg")

  #   profile = Profile.create!(image: foto, full_name: 'Joao', social_name: 'Lu', birth_date: '25/12/1997', description: 'Engenheiro de software a 2 dois anos trabalho com ruby e ruby on rails', avatar: page, professional: professional)
  #   login_as professional, scope: :professional

  #   visit root_path

  #   expect(page).to have_image("picture.jpg")
  #   expect(page).to have_content(professional.email)
  #   expect(page).to have_link('Ver projetos disponíveis')
  #   expect(page).to have_link('Veja seu perfil')
  #   expect(page).to have_link('Logout')
  #   expect(page).to have_content('Jobfy')
  #   expect(page).to have_content('Bem vindo ao jobfy')
  #   expect(page).to have_content('Conectando desenvolvedores e projetos')
  #   expect(page).to have_content('Joao')
  #   expect(page).to have_content('Lu')
  #   expect(page).to have_content('25/12/19')
  #   expect(page).to have_content('Engenheiro de software a 2 dois anos trabalho com ruby e ruby on rails')
  # end
end

