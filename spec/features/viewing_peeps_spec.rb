feature 'Viewing peeps' do 
  scenario 'a user can see peeps' do 
    visit('/peeps')

    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end 
end