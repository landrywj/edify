RSpec.describe "Login" do 
  fixtures :users
    it "allows a user to login" do 
      visit '/users/sign_in'
      within("form") do
        fill_in 'Email', :with => 'info@edify.online'
        fill_in 'Password', :with => 'secret123'
      end
      click_button 'Log in'
        expect(page).to have_content 'Campus'
    end
end