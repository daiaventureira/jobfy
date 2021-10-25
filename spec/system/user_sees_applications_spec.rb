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
    # expect(page).to have_content( 'Status: pendente')
  end

  it 'and accepts request' do 

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
    attach_file('Foto', "#{Rails.root}/spec/fixtures/picture.jpg")

    click_on "Criar"

    visit root_path
    click_on 'Ver projetos disponíveis'
    click_on "Web"

  end

end
