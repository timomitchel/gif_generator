require 'rails_helper'

describe "admin user can create a category" do 
  context "it visits the index page" do 
    context "it fills in category name box" do
      context "it clicks on create category" do 
        it "has a new gif stored to the database and it loads on page" do 

        admin = create(:user, role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_categories_path
        category_count = Category.all.count
        fill_in "category[name]", with: 'excited'
        click_on "Create Category"

        expect(current_path).to eq(admin_categories_path)
        expect(Category.all.count).to eq(category_count + 1)
        end 
      end
    end 
  end
end