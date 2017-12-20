require "rails_helper"

describe "registered user logs in" do
  context "they visit the root page" do
    context "they click login link" do
      context "they enter username and password" do
        it "logs in a user" do
          admin = create(:user, role: 1)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
          visit "/"

          click_on "Log In"

          expect(current_path).to eq(login_path)
          fill_in 'sessions[username]', with: admin.username
          fill_in 'sessions[password]', with: admin.password

          click_on "Log In"

          expect(page).to have_content("Welcome, #{admin.username}")
        end
      end
    end
  end
end
