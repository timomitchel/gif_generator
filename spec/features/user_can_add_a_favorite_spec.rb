require 'rails_helper'

describe 'a user can add a favorite' do
  before(:each) do
    @user = create(:user)
  end
  it 'can click on a favorite and it is stored in db for particular user' do
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit
    click_on 'Add To Favorite'

    expect(user.favorites.count).to eq 1
  end
end