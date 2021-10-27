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

  it "and should return social name if it exists" do 
    professional = Professional.create!(email: 'uer@user.com.br', password: '123456')
    b_day = 30.years.ago
    profile = Profile.create!(full_name: 'Isa Manueli', birth_date: b_day, social_name: 'Jo', description: "oi eu sou a iza", educational_background: "Artes", experience: '2', professional: professional)
    login_as professional, scope: :professional 

    visit root_path
    
    expect(page).to have_content("Olá Jo :)")
    expect(page).to_not have_content("Olá Isa Manueli :)")

  end

  it "and get error if not properly update profile" do 
    professional = Professional.create!(email: 'uer@user.com.br', password: '123456')
    b_day = 30.years.ago
    profile = Profile.create!(full_name: 'Isa Manueli', birth_date: b_day, description: "oi eu sou a iza", educational_background: "Artes", experience: '2', professional: professional)
    login_as professional, scope: :professional 

    visit root_path
    click_on 'Veja seu perfil'

    fill_in 'Nome completo', with: nil
    fill_in 'Data de nascimento', with: nil
    click_on "Atualizar"

    expect(page).to have_content("Data de nascimento deve ser preenchido")
    expect(page).to have_content("Data de nascimento não pode ficar em branco")
    expect(page).to have_content("Nome completo não pode ficar em branco")
    expect(page).to_not have_content("Olá Isa Manueli :)")
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

  it "and get an error when age is lesser than 18 years" do 
    professional = Professional.create!(email: 'user@user.com.br', password: '123456')
    date = 3.years.ago
    profile = Profile.new(full_name: 'Isa Manueli', birth_date: date, description: "oi eu sou a iza", educational_background: "Artes", experience: '2', professional: professional)

    expect(profile.valid?).to eq false
  end
  
  it "and return message error when fields are not properly fullfilled" do 
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

    click_on "Criar"

    expect(page).to have_content('Data de nascimento deve corresponder a um profissional de 18 anos ou mais.')
    expect(page).to have_content('Experiência não pode ficar em branco')
    expect(page).to_not have_current_path("/")
    end
end

