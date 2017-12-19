require 'rails_helper'

describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end
  describe 'validations' do
    context 'valid attributes' do
      it {should validate_presence_of(:username)} 
      it {should validate_presence_of(:password)} 
      it {should validate_presence_of(:role)} 

    end
  end
  describe 'roles' do 
     it 'can be created as an admin' do
        user = create(:user, role: 1) 


        expect(user.role).to eq("admin")
        expect(user.admin?).to be_truthy
    end
    it 'can be created as default user' do 
      expect(@user.role).to eq("default")
      expect(@user.admin?).to be_falsy
    end
  end
  describe 'secure password' do 
    it {should have_secure_password}

  end
end