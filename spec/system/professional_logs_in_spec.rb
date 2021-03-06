require 'rails_helper'

describe 'Professional signs up' do 
  it 'successfully' do 
    visit root_path
    
    click_on "Entrar como profissional"
    click_on 'Sign up'
    
    fill_in 'Email', with: 'professional@p.com.br'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    
    click_on 'Sign up'
    
    expect(page).to have_content("Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail.")
    expect(page).to have_content('professional@p.com.br')
    expect(page).to have_link('Logout')
    expect(page).to_not have_link('Entrar como profissional')
  end

  it 'and logs in' do
    professional = Professional.create!(email: 'professional@p.com.br', password: '123456')

    visit root_path

    click_on "Entrar como profissional"
    fill_in 'Email', with: 'professional@p.com.br'
    fill_in 'Password', with: '123456'
      
    click_on 'Log in'
    
    expect(page).to have_content("Login efetuado com sucesso!")
    expect(page).to have_content('professional@p.com.br')
    expect(page).to have_link('Logout')
    expect(page).to_not have_link('Entrar como profissional')
  end

  it 'and logs out' do  
    professional = Professional.create!(email: 'professional@p.com.br', password: '123456')
    login_as professional, scope: :professional

    visit projects_path

    click_on "Logout"

    expect(page).to have_content("Saiu com sucesso.")
    expect(page).to_not have_current_path("/projects")
    expect(page).to have_current_path("/")
  end

  it "professional gets error if password is wrong" do 
    visit root_path
    
    click_on "Entrar como profissional"
    click_on 'Sign up'
    
    fill_in 'Email', with: 'professional@p.com.br'
    fill_in 'Password', with: '1236'
    fill_in 'Password confirmation', with: '1236'
    
    click_on 'Sign up'
    
    expect(page).to have_content("Password é muito curto (mínimo: 6 caracteres)")
  end
  
  it "professional gets error if do not have an account" do 
    visit root_path
    click_on "Entrar como profissional"   

    fill_in 'Email', with: 'professional@p.com.br'
    fill_in 'Password', with: '1236'

    click_on 'Log in'
    
    expect(page).to have_content("Email ou senha inválida.")
  end
end
