describe 'User Stories' do

  # As a Player,
  # So I can Lose a game of Battle,
  # I want to see a 'Lose' message if I reach 0HP first
  feature 'Lose Game' do
    scenario "a 'Lose' message appears when 0HP is reached" do
      sign_in_and_play
      allow(Kernel).to receive(:rand) { 50 }
      click_button 'Attack!'
      expect(page).to have_content 'Jane loses!'
    end
  end

end
