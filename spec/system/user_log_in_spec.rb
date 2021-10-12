require 'rails_helper'

describe 'User creates account' do
    it 'successfully' do  
      
        visit root_path
        
        click_on 'Entrar'
        click_on 'Sign up'

        fill_in :Email, with: 'daiane@souza.com.br'
        fill_in :Password, with: '123456'
        fill_in :Password_confirmation, with: '123456'

        click_on 'Sign up'

        expect(page).to have_content('Conta criada com sucesso')
        expect(page).to have_content('daiane@souza.com.br')
        expect(page).to have_link('Logout')
        expect(page).to_not have_link('Entrar')
    end 
end

    