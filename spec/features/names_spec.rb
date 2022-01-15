feature 'Sign Up Form' do 
  scenario "User can sign up with username and see on screen" do 
    visit '/'
    fill_in 'user_id', with: 'Josh'
    click_button('Submit')
  end 
end 
