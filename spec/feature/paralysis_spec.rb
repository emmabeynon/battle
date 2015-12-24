describe 'Paralysis attack' do
  feature 'paralyses player' do
    before do
      allow(Kernel).to receive(:rand) { 10 }
    end
    scenario 'confirms that Player 1 has paralysis attacked Player 2' do
      sign_in_and_play
      click_button "Paralyse!"
      expect(page).to have_content 'Joe has paralysis attacked Jane!'
    end
    context 'no paralysis' do
      before {srand(0)}
    scenario "reduces Player 2's hit points" do
      sign_in_and_play
      paralyse
      expect(page).not_to have_content 'Jane: 50 HP'
      expect(page).to have_content 'Jane: 40 HP'
    end
    end
    context 'paralysis' do
      before {srand(4)}
      scenario "Player 2 should be paralysed" do
        sign_in_and_play
        paralyse
        expect(page).to have_content 'Jane is paralysed'
      end
      scenario "Player 2 misses go" do
        sign_in_and_play
        paralyse
        click_button "OK"
        expect(page).to have_content "It's Joe's turn."
      end
      scenario "Player 2 dies if large enough attack"do
        sign_in_and_play
        allow(Kernel).to receive(:rand) { Player::DEFAULT_HP}
        click_button "Paralyse!"
        expect(page).to have_content 'Jane loses!'
      end
    end
  end
end
