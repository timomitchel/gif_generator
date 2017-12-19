require 'rails_helper'

describe 'user visits categories index page' do
  context 'as an admin' do 
    it 'allows admin to see all categories' do 
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content("All Categories")
    end
  end
  context 'as a default user' do 
    it 'does not allow default user to see all categories index' do 
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content("All Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end