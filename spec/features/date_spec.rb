feature 'Viewing test page' do
  scenario 'visiting the test page' do

    Peep.create(message: "Peep1", date: '21/05/21')
    Peep.create(message: "Peep2", date: '22/05/21')
    Peep.create(message: "Peep3", date: '23/05/21')

    visit('/home')

    expect(page).to have_content('21/05/21')
    expect(page).to have_content('22/05/21')
    expect(page).to have_content('23/05/21')
  end
end
