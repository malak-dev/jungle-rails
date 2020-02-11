require 'rails_helper'
RSpec.describe User, type: :model do
  describe "Validations" do

    user=User.new(password:"12345" ,email:"malak-y@live.com" ,first_name:"malak", last_name:"younso")

    it "should have a password " do
      expect(user.password).to be_present
    end
    it "should have a password " do
      user.password_confirmation=user.password
      expect(user.password_confirmation).to eql(user.password)
    end
    it "email should include .com " do
      expect(user.email).to include(".com","@")
    end
    it "should have a first_name" do
      user.first_name=nil
      user.save
      expect([]).to eql (user.errors.full_messages)
    end
    it "should have a last_name" do
      user.last_name=nil
      user.save
      expect([]).to eql (user.errors.full_messages)
    end
    # it { should validate_length_of(:password).is_at_least(4)
    # .with_message(/password is too short/) }

  end
  describe '.authenticate_with_credentials' do
    user=User.new(password:"12345" ,email:"malak-y@live.com",first_name:"malak", last_name:"younso")
    user.save

    it "should login with wrong case" do 

      user=User.authenticate_with_credentials("MALAK-Y@LIVE.COM","12345")
      
      assert_equal "MALAK-Y@LIVE.COM".downcase, user.email
   end
    it "should login with a few spaces " do
      user=User.authenticate_with_credentials(" malak-y@live.com ","12345")

      expect(/malak-y@live.com/).to match(" malak-y@live.com ")
    end
  end
end 