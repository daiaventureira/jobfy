require 'rails_helper'

describe 'User add project' do
    it 'successfully' do 
        dai = User.create!(email: 'dai@ane.com.br', password: '123456')
        date = 5.days.from_now 

        login_as dai, scope: :user 

        visit root_path

        click_on 'Adicionar projeto'

        fill_in 'Título', with: 'Website'
        fill_in 'Descrição', with: 'Procuro desenvolvedores que consigam fazer um simples website de recrutamento'
        fill_in 'Habilidades', with: 'Básico conhecimento em JavaScript, CSS, HTML, profundo conhecimento em Ruby e orientação a objetos'
        fill_in 'Preço por hora', with: '200,00'
        fill_in 'Data limite', with: date
        check 'Remoto'

        click_on 'Adicionar'

        expect(page).to have_content('Título: Website')
        expect(page).to have_content('Descrição: Procuro desenvolvedores que consigam fazer um simples website de recrutamento')
        expect(page).to have_content('Habilidades: Básico conhecimento em JavaScript, CSS, HTML, profundo conhecimento em Ruby e orientação a objetos')
        expect(page).to have_content("Preço por hora: R$ 200,00")
        expect(page).to have_content("Data limite: #{date.strftime("%d/%m/%Y")}")
        expect(page).to have_content('Remoto')
    end

    it 'goes to add project page' do
        
        dai = User.create!(email: 'dai@ane.com.br', password: '123456')

        login_as dai, scope: :user 
        visit root_path
        click_on 'Adicionar projeto'

        expect(page).to have_content('Título')
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Preço por hora')
        expect(page).to have_content('Data limite')
        expect(page).to have_content('Remoto') 
    end

    it 'and should not be valid' do 
    
        projeto = Project.new(title: 'Website', description: 'descricao', skills: 'skills', price_per_hour: 'R$ 90,00', deadline: 1.day.ago, remote: true )

        visit projects_path

        expect(projeto.valid?).to eq false
    end
end
