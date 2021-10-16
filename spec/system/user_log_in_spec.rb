require 'rails_helper'

describe 'User access account' do
    it 'successfully' do  
      
        visit root_path
        
        click_on 'Entrar como usuário'
        click_on 'Sign up'

        fill_in 'Email', with: 'daiane@souza.com.br'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'

        click_on 'Sign up'

        expect(page).to have_content('Welcome! You have signed up successfully.')
        expect(page).to have_content('daiane@souza.com.br')
        expect(page).to have_link('Logout')
        expect(page).to_not have_link('Entrar')
    end
    it "and logs in" do 
        user = User.create!(email: 'daiane@souza.com.br', password: '123456')

        visit root_path 

        click_on "Entrar como usuário"

        fill_in "Email", with: user.email 
        fill_in "Password", with: user.password 

        click_on 'Log in'

        expect(page).to have_content( "Signed in successfully")
        expect(page).to have_content(user.email)
        expect(page).to have_link('Logout')
        expect(page).to_not have_link('Entrar')
    end

    it "and logs out" do 
        user = User.create!(email: 'daiane@souza.com.br', password: '123456')

        login_as user, scope: :user
        visit root_path

        click_on 'Logout'

        expect(page).to have_content('Signed out successfully.')
        expect(page).to_not have_content(user.email)
        expect(page).to_not have_link('Logout')
        expect(page).to have_link('Entrar')
    end
end

