feature 'post a new peep' do
  scenario 'user can post a new peep to the chitter feed' do
    visit('/peep')
    fill_in('message', with: 'peeptest1')
    click_button('Submit')

    expect(page).to have_content('peeptest1')
  end
end
