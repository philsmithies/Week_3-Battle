require_relative '../../app.rb'

feature 'Entering Names' do
  scenario 'User can enter names' do
    visit('/')
    sign_in_and_play
    expect(page).to have_text 'Scooby vs. Scrappy!'
  end
end
