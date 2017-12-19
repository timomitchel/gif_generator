require 'rails_helper'

describe 'user sees all of their favorite gifs after loggin ing' do 
  context 'user visits root' do 
    context 'user clicks on log_in' do 
      context 'user enters valid credentials' do 
        it 'is brough to a show page with a display of their favorite gifs' do 

          user = create(:user)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit user_path(user)
        end
      end
    end
  end
end