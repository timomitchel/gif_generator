
require 'rails_helper'

describe "User visits gifs#new" do
  context "as admin" do
    it "they can generate gifs" do

      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/'

      click_on 'Generate GIF'

      expect(current_path).to eq(new_admin_gif_path)
      expect(page).to have_content("Generate Gifs")

      fill_in "gif[search_term]", with: "cat"
      click_on "Generate GIF"

      expect(current_path).to eq(gifs_path)
    end
  end
  context "as user" do
    it "they cannot see link to generate gifs" do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/'

      expect(page).to_not have_content("Generate Gifs")
    end
    it "they cannot access page even with link" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit new_admin_category_gif_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end