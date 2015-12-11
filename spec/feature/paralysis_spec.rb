describe 'User Stories' do
  feature 'Paralysis' do
    before do

    end
    scenario 'confirms that Player 1 has paralysis attacked Player 2' do
      sign_in_and_play
      allow(Kernel).to receive(:rand) { 10 }
      click_button "Paralyse!"
      expect(page).to have_content 'Joe has paralysis attacked Jane!'
    end
    context 'no paralysis' do
    scenario "reduces Player 2's hit points" do
      sign_in_and_play
      allow(Kernel).to receive(:rand) { 10 }
      click_button "Paralyse!"
      allow(Kernel).to receive(:rand).and_return(1)
      click_button "OK"
      expect(page).not_to have_content 'Jane: 50 HP'
      expect(page).to have_content 'Jane: 40 HP'
    end
    end
  end
end
