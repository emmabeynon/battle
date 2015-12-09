describe 'User Stories' do

  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation
  feature 'Attack player' do
    scenario 'confirmation that player 2 has been attacked' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Joe has attacked Jane!'
    end
  end
end
