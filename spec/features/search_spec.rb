feature 'Search Peeps' do
  scenario 'Returns peeps with search criteria' do

    Peep.create(message: "peep", date: '21/05/21')
    Peep.create(message: "chitter", date: '21/05/21')
    Peep.create(message: "peep", date: '21/05/21')
    visit('/home')

    fill_in('keyword', with: 'chitter')
    click_button('Search')
    visit('/search')

    expect(page).to have_content('chitter')
  end


  scenario 'Returns error to user if nothing available' do

    Peep.create(message: 'peep1', date: '21/05/2021')
    Peep.create(message: 'peep2', date: '21/05/2021')

    visit '/home'

    expect(page).to have_content('peep1')
    expect(page).to have_content('peep2')

    fill_in('keyword', with: 'strawberry')
    click_button('Search')

    expect(page).to have_content('Sorry. No results found. Try again.')
  end
end
