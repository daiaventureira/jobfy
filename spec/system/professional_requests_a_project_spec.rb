require 'rails_helper'

describe 'professional requests a project' do 
  it 'successfully' do 
      professional = Professional.create!(email: 'pro@fissional.com.br', password: '123456')

      user = User.create!(email: 'user@user.com.br', password: '123456')

      project = Project.create!(title: 'Website', description: 'descricao', skills: 'skills', price_per_hour: 'R$ 90,00', deadline: 2.days.from_now, remote: true, user: user )

      login_as professional, scope: :professional

      date = '27/04/1997'

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
      click_on 'Ver projetos disponíveis'
      click_on "Web"

      fill_in 'Introdução', with: 'Olá eu quero participar do seu projeto'

      click_on 'Candidatar-se'

      expect(page).to have_content('Você se candidatou para fazer parte desse projeto com sucesso!')
      expect(page).to have_content('Olá eu quero participar do seu projeto')
    end
end
