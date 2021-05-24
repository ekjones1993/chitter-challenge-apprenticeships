require 'pg'

feature 'View Peeps' do
  scenario 'Allows the user to view peeps' do

    Peep.create(message: 'peep1')
    Peep.create(message: 'peep2')

    visit '/home'

    expect(page).to have_content('peep1')
    expect(page).to have_content('peep2')
  end
end
