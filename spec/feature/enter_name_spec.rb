describe 'User Stories' do

  # As two Players,
  # So we can play a personalised game of Battle,
  # We want to Start a fight by entering our names and seeing them
  feature 'name form' do
    scenario 'submit name' do
      sign_in_and_play
      expect(page).to have_content 'Joe vs Jane'
    end
  end

end
