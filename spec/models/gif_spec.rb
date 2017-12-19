require 'rails_helper'

describe Gif do
   before(:each) do
    @category = Category.new(name: "Education")
  end
  describe 'validations' do
    context 'invalid attributes' do
      it 'is valid with a new url' do

        @category.gif = Gif.new(url: "www.google.com")
        expect(gif).to respond_to(:category)
      end
    end
  end
end 
 