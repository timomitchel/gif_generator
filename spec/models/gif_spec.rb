require 'rails_helper'

describe Gif do
   before(:each) do
    @category = create(:category)
  end
  describe 'validations' do
    context 'invalid attributes' do
      it 'is valid with a new url' do

        gif = @category.gifs.create!(url: "www.google.com")
        byebug
        expect(gif).to respond_to(:category)
      end
    end
  end
end 
 