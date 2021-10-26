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

    click_on "Criar"
    visit root_path

    expect(page).to have_content(professional.email)
    expect(page).to have_link('Ver aplicações')
    expect(page).to have_link('Ver projetos disponíveis')
    expect(page).to have_link('Logout')
    expect(page).to have_content('Bem vinde ao jobfy!')
    expect(page).to have_content('Conectando desenvolvedores e projetos')
  end

  it "and should complete profile fullfillment before see projects" do 
    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    
    login_as professional, scope: :professional 
    visit root_path

    expect(page).to have_link('Crie')
    expect(page).to_not have_link('Veja seu perfil')
  end

  it "and get error if not properly update profile" do 
    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    birth_date = 18.years.ago
    profile = Profile.create!(full_name: 'Daiane', birth_date: birth_date, description: 'Descricap', educational_background: 'Art', experience: '2', professional: professional)

    login_as professional, scope: :professional 
    visit root_path
    click_on 'Veja seu perfil'

    fill_in 'Nome completo', with: 'Joao'
    fill_in 'Nome social', with: 'Jo'
    fill_in 'Data de nascimento', with: birth_date
    fill_in 'Descrição', with: 'Olá essa é minha descriçao'
    fill_in 'Formação', with: 'Olá essa é minha formação'
    fill_in 'Experiência', with: ""

    click_on "Atualizar"
    
    expect(page).to have_button("Atualizar")
    expect(page).to have_content('Verifique se os campos atualizados estão devidamente preenchidos')
  end

  it "and navigate successfully" do
    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    date = '27/04/1997'

    login_as professional, scope: :professional
    visit root_path

    click_on 'Crie'
    
    fill_in 'Nome completo', with: 'Joao'
    fill_in 'Nome social', with: 'Jo'
    fill_in 'Data de nascimento', with: date
    fill_in 'Descrição', with: 'Olá essa é minha descriçao'
    fill_in 'Formação', with: 'Olá essa é minha formação'
    fill_in 'Experiência em anos', with: '2'

    click_on "Criar"
    visit root_path
  
    expect(page).to have_content(professional.email)
    expect(page).to have_link('Ver projetos disponíveis')
    expect(page).to have_link('Veja seu perfil')
    expect(page).to have_link('Logout')
    expect(page).to have_content('Jobfy')
    expect(page).to have_content('Bem vinde ao jobfy')
    expect(page).to have_content('Conectando desenvolvedores e projetos')
    expect(page).to have_content('Olá Jo :)')
  end

  # it 'and should return error when update wrongly' do
  #   prof= Professional.create!(email: 'profile@professional.com.br', password: '123456')
  #   b_date = 30.years.ago
    
  #   profile = Profile.new(full_name: 'Isa', birth_date: b_date, description: "oi eu sou a iza", educational_background: "Artes", experience: '2', professional: prof)
  #   login_as prof, scope: :professional

  #   visit root_path

  #   expect(page).to have_content("Olá Isa :)")
  # end

  it "and get an error when age is lesser than 18 years" do 
    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    date = 3.years.ago
    profile = Profile.new(full_name: 'Isa Manueli', birth_date: date, description: "oi eu sou a iza", educational_background: "Artes", experience: '2', professional: professional)

    expect(profile.valid?).to eq false
  end
  
  it "and return message error when field are not properly fullfilled" do 
    professional = Professional.create!(email: 'pro@prof.com.br', password: '123456')
    birth_date = 4.years.ago 

    login_as professional, scope: :professional 
    visit root_path
    click_on "Crie"

    fill_in 'Nome completo', with: 'Joao'
    fill_in 'Nome social', with: 'Jo'
    fill_in 'Data de nascimento', with: birth_date
    fill_in 'Descrição', with: 'Olá essa é minha descriçao'
    fill_in 'Formação', with: 'Olá essa é minha formação'
    fill_in 'Experiência em anos', with: '2'

    click_on "Criar"

    expect(page).to have_content('Verifique se os campos estão devidamente preenchidos')
  end
end

