feature 'Posting a new peep' do 
  scenario 'A user can add a peep to Peep Manager' do 
    sign_in
    click_button ('Add peep')
    fill_in 'message', with: 'This is my test peep'
    click_button ('Submit')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('This is my test peep')
  end 
end 