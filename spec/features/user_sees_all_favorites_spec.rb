require 'rails_helper'

describe 'a logged in user sees all of their favorite gifs' do
  context 'a user logs in' do 
    context 'a user clicks the favorites link in the nav bar' do 
      it 'sees all favorited gifs on the page' do
          user = create(:user)
          category = create(:category)
          gif = category.gifs.create!(category_id: category.id, url: "https://media3.giphy.com/media/lYTlomlpfYiTS/giphy.gif")
          gif_2 = category.gifs.create!(category_id: category.id, url: "https://media.giphy.com/media/l3mZdSnHSavSnJdEk/giphy.gif")
          gif_3 = category.gifs.create!(category_id: category.id, url: "https://media.giphy.com/media/fWmbIgrMSsgHm/giphy.gif")
          favorite_1 = user.favorites.create!(user_id: user.id, gif_id: gif.id)
          favorite_2 = user.favorites.create!(user_id: user.id, gif_id: gif_2.id)
          favorite_3 = user.favorites.create!(user_id: user.id, gif_id: gif_3.id)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          visit '/'
          click_on 'Favorites'

          expect(page).to have_css("img[src*='https://media3.giphy.com/media/lYTlomlpfYiTS/giphy.gif']")
          expect(page).to have_css("img[src*='https://media.giphy.com/media/l3mZdSnHSavSnJdEk/giphy.gif']")
          expect(page).to have_css("img[src*='https://media.giphy.com/media/fWmbIgrMSsgHm/giphy.gif']")
      end
    end
  end
end