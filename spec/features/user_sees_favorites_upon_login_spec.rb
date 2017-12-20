require 'rails_helper'

describe 'user sees all of their favorite gifs after loggin ing' do 
  context 'user visits root' do 
    context 'user clicks on log_in' do 
      context 'user enters valid credentials' do 
        it 'is brough to a show page with a display of their favorite gifs' do 

          user = create(:user)
          category = create(:category)
          gif = category.gifs.create!(category_id: category.id, url: "https://media3.giphy.com/media/lYTlomlpfYiTS/giphy.gif")
          favorite = user.favorites.create!(user_id: user.id, gif_id: gif.id)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit user_path(user)
          save_and_open_page
          expect(page).to have_content("Your Favorite GIFs")
          expect(page).to have_css("img[src*='https://media3.giphy.com/media/lYTlomlpfYiTS/giphy.gif']")
        end
      end
    end
  end
end