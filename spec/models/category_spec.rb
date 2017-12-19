require 'rails_helper'

describe Category, type: :model do
  before(:each) do
    @category = create(:category)
  end
  describe 'validations' do
    context 'valid attributes' do
      it {should validate_presence_of(:name)} 

    end
  end
  describe 'relationships' do
    it {should have_many(:gifs)}
  end
  describe 'uniqueness' do 
    it {should validate_uniqueness_of(:name)}
  end
end