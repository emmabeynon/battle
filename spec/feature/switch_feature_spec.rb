describe 'User Stories' do

  # As two Players,
  # So we can continue our game of Battle,
  # We want to switch turns
  feature 'switch turns' do
    scenario 'the current player has their turn' do
      sign_in_and_play
      expect(page).to have_content "It's Joe's turn."
    end

    scenario 'the turn switches to another player' do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content "It's Joe's turn."
      expect(page).to have_content "It's Jane's turn."
    end
  end
end
