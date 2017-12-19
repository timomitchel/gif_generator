
require 'rails_helper'

describe "User visits gifs#new" do
  context "as admin" do
    it "they can generate gifs" do

      admin = create(:user, role: 1)
      Category.create(name: 'happyg')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/'

      click_on 'Generate GIF'

      expect(current_path).to eq(new_admin_category_path)
      expect(page).to have_link("Generate GIF")
      expect(page).to have_link("Favorites")
      expect(page).to have_link("Categories")
      expect(page).to have_link("Log Out")
      
      fill_in "category[name]", with: "happy"
      click_on "Create Category"

    expect(current_path).to eq admin_categories_path
    expect(page).to have_content("happy")
    expect(Category.count).to eq 1
    expect(Gif.count).to eq 1
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

      visit new_admin_category_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end