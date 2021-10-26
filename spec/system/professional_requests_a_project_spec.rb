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
  
      click_on "Criar"
  
      visit root_path
      click_on 'Ver projetos disponíveis'
      click_on "Website"

      fill_in 'Introdução', with: 'Olá eu quero participar do seu projeto'

      click_on 'Candidatar-se'

      expect(page).to have_content('Você se candidatou para fazer parte desse projeto com sucesso!')
      expect(page).to have_content('Olá eu quero participar do seu projeto')
      expect(page).to have_content('Sua Aplicação para o projeto Website')
      expect(page).to have_content('Introdução')
      expect(page).to have_content('Olá eu quero participar do seu projeto')
      expect(page).to_not have_link("Candidatar-se")
    end

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
  
      click_on "Criar"
  
      visit root_path
      click_on 'Ver projetos disponíveis'
      click_on "Website"
      click_on 'Candidatar-se'

      expect(page).to have_content('Deve ter introdução')
    end

    it "and application is pending" do 
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
  
      click_on "Criar"
      visit root_path
      click_on 'Ver projetos disponíveis'
      click_on "Website"
      fill_in 'Introdução', with: 'Olá eu quero participar do seu projeto'
      click_on 'Candidatar-se'
      click_on "Ver aplicações"

      expect(page).to have_content("Sua candidatura está pendente")
    end

    it "and professional cannot aply for the same project twice" do 
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
  
      click_on "Criar"
      visit root_path
      click_on 'Ver projetos disponíveis'
      click_on "Website"
      fill_in 'Introdução', with: 'Olá eu quero participar do seu projeto'
      click_on 'Candidatar-se'
      click_on "Ver projetos disponíveis"
      click_on "Website"

      expect(page).to have_content("Você já se candidatou! Acompanhe suas aplicações. Em breve terá uma resposta.")
    end

    it "and can cancel application if pending" do 
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
  
      click_on "Criar"
      visit root_path
      click_on 'Ver projetos disponíveis'
      click_on "Website"
      fill_in 'Introdução', with: 'Olá eu quero participar do seu projeto'
      click_on 'Candidatar-se'
      click_on "Ver aplicações"
      click_on "Cancelar sua aplicação"

      expect(page).to_not have_content("Sua candidatura está pendente")
      expect(page).to have_content("Você cancelou uma proposta")
    end

    it "and cancel application if it's been accepted in less than 3 days" do 
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

      project_application = ProjectApplication.create!(introduction: "Olá quero participar",professional: professional, project: project, status: 10, updated_at: 2.days.ago)

      visit project_applications_path
      click_on "Cancele sua aplicação"
      fill_in "Justificativa", with: "Não quero mais"
      click_on "Cancelar"

      expect(page).to_not have_content("Sua candidatura foi aceita!")
      expect(page).to have_content("Você cancelou essa aplicação com a justificativa de: Não quero mais")
    end

    it "and cancel application if it's been accepted in less than 3 days" do 
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

      project_application = ProjectApplication.create!(introduction: "Olá quero participar",professional: professional, project: project, status: 10, updated_at: 4.days.ago)
      visit project_applications_path
     

      expect(page).to_not have_link("Cancele sua aplicação")
      expect(page).to have_content("Sua candidatura foi aceita!")
    end
end
