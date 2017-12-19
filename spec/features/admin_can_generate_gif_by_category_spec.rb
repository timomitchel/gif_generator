require 'rails_helper'

describe "admin user can search and generate a gif by category" do 
  context "it visits the index page" do 
    context "it fills out generate gif box" do
      context "it clicks on generate gif" do 
        it "has a new gif stored to the database and it loads on page" do 

        admin = create(:user, role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_categories_path
        gif_count = Gif.all.count
        fill_in "admin[category]", with: 'excited'
        click_on "create category"

        expect(current_path).to eq(gifs_path)
        expect(Gif.count).to eq(gif_count + 1)
        end 
      end
    end 
  end
end