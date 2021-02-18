require 'pg'

feature 'viewing /peeps' do
  scenario 'it displays peep text' do
    Peep.create(peep_text: "My first peep", time: 'NOW()')
    Peep.create(peep_text: "My second peep", time: 'NOW()')
    visit('/peeps')
    expect(page).to have_content("My first peep")
    expect(page).to have_content("My second peep")
  end
end

feature 'Adding a new peep' do
  scenario 'A user can post a peep' do
    timenow = Time.now.to_s
    visit('/peeps/new')
    fill_in('peep_text', with: "This is a peep")
    fill_in('time', with: 'NOW()')
    find('input[name="Submit"]').click
    expect(page).to have_content("This is a peep")
    expect(page).to have_content(timenow[0...16])
  end
end

feature 'User can sign up' do
  scenario 'A user can enter details' do
    User.create(username: "my username1", name: "name2", email: "email@email.com3", password: "my password4")
    visit('/signup')
    expect(page).to have_content("Enter details to sign up")
  end
end

feature 'Entering users details' do
  scenario 'A user signs up' do
    visit('/signup')
    fill_in('email', with: "email@email.com")
    fill_in('password', with: "my password")
    fill_in('name', with: "my name")
    fill_in('username', with: "my username")
    find('input[name="Signup"]').click
    expect(page).to have_content("Peeps and Time posted")
  end
end
