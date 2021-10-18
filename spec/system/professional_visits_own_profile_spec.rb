require 'rails_helper'

describe 'Professional visits own profile' do 
  it 'successfully' do 
    professional = Professional.create!(email: 'luan@fessional.com.br', password: '123456')
    login_as professional, scope: :professional
    date = '27/04/1997'

    visit root_path

    click_on 'Crie'
    
    fill_in 'Nome completo', with: 'Daiane Souza'
    fill_in 'Data de nascimento', with: date
    fill_in 'Descrição', with: 'Olá essa é minha descriçao'
    fill_in 'Formação', with: 'Olá essa é minha formação'
    attach_file('Foto', "#{Rails.root}/spec/fixtures/picture.jpg")

    click_on "Criar"  

    click_on 'Veja seu perfil'    
    expect(page).to have_content('Nome completo')
    expect(page).to have_content('Data de nascimento')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Formação')
    expect(page).to have_button('Atualizar')
    expect(page).to_not have_content('Jobfy')
  end

  it 'and successfully update fields' do
    professional = Professional.create!(email: 'lu@fessional.com.br', password: 123456)
    login_as professional, scope: :professional

    date = '27/04/1997'
    visit root_path
    click_on 'Crie'
    
    fill_in 'Nome completo', with: 'Daiane Souza'
    fill_in 'Data de nascimento', with: date
    fill_in 'Descrição', with: 'Olá essa é minha descriçao'
    fill_in 'Formação', with: 'Olá essa é minha formação'
    attach_file('Foto', "#{Rails.root}/spec/fixtures/picture.jpg")

    click_on "Criar"  

    click_on 'Veja seu perfil'

    fill_in 'Nome completo', with: 'Luana'
    fill_in 'Data de nascimento', with: '29/10/1987'
    fill_in 'Descrição', with: 'Olá eu sou a Luana e sou produtora musical'
    
    click_on 'Atualizar'

    expect(page).to have_content('jobfy')
    expect(page).to have_content('Luana')
    expect(page).to_not have_button('Atualizar')
  end
end




