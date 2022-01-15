feature 'Viewing peeps' do 
  scenario 'a user can see peeps' do 
    connection = PG.connect(dbname: 'peep_manager_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Peep 1');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Peep 2');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Peep 3');")

    visit('/peeps')

    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end 
end
