feature 'Viewing peeps' do 
  scenario 'a user can see peeps' do 
    Peep.create(message: 'Peep 1', user_id: 'Josh Lim')
    Peep.create(message: 'Peep 2', user_id: 'Josh Lim')
    Peep.create(message: 'Peep 3', user_id: 'Josh Lim')

    visit('/peeps')

    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end 
end
