def sign_in
  visit '/'
  fill_in 'user_id', with: 'Josh Lim'
  click_button('Submit')
end 