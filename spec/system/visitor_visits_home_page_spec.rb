require 'rails_helper'

describe 'Visitor visit homepage' do
 it 'successfully' do 
    visit root_path 

    expect(page).to have_content('Jobfy')
    expect(page).to have_content('Bem vinde ao jobfy')
    expect(page).to have_content('Conectando desenvolvedores e projetos')
 end
end
