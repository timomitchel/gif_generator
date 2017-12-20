require "rails_helper"

describe "registered user logs in" do
  context "they visit the root page" do
    context "they click login link" do
      context "they enter username and password" do
        it "logs in a admin" do
          admin = create(:user, role: 1)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
          visit "/"

          click_on "Log In"

          expect(current_path).to eq(login_path)
          fill_in 'sessions[username]', with: admin.username
          fill_in 'sessions[password]', with: admin.password

          click_on "Log In"
          expect(admin.admin?).to be_truthy
          expect(current_path).to eq(admin_user_path(admin))
        end
        skip
        it "logs in a user" do
          @user = create(:user, role: 0)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
          visit "/"

          click_on "Log In"

          expect(current_path).to eq(login_path)
          fill_in 'sessions[username]', with: @user.username
          fill_in 'sessions[password]', with: @user.password

          click_on "Log In"
          expect(current_path).to eq(user_path(@user))
          expect(@user.admin?).to be_falsy
          expect(page).to have_content("Welcome, #{@user.username}")
        end
      end
    end
  end
end
