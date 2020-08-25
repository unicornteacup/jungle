require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should save when all required fields are filled" do
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisgreat"})

      @user.save

      expect(@user).to be_present

    end

    it "should display 'First Name can't be blank' if no first name is entered" do
      
      @user = User.new({first_name: nil, last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisgreat"})
    
      @user.valid?
    
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should display 'Last Name can't be blank' if no last name is entered" do
      
      @user = User.new({first_name: "Bob", last_name: nil, email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisgreat"})
    
      @user.valid?
    
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should display 'Email can't be blank' if no email is entered" do
      
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: nil, password: "bobisgreat", password_confirmation: "bobisgreat"})
    
      @user.valid?
    
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should display 'Password can't be blank' if no password is entered" do
      
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: nil, password_confirmation: "bobisgreat"})
    
      @user.valid?
    
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should display 'Password Confirmation can't be blank' if no password confirmation is entered" do
      
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: nil})
    
      @user.valid?
    
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should display 'Password is too short (minimum is 6 characters)' if password entered is less than 6 characters" do
      
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobis", password_confirmation: "bobis"})
    
      @user.valid?
    
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "should display 'Password Confirmation is too short (minimum is 6 characters)' if password confirmation entered is less than 6 characters" do
      
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobis", password_confirmation: "bobis"})
    
      @user.valid?
    
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "should display Password confirmation doesn't match Password if the password and password confirmation are not the same" do
      
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisnotgreat"})
    
      @user.valid?
    
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return the user if an existing user logs in with the correct email and password" do
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisgreat"})

      @user.save

      expect(User.authenticate_with_credentials("bobisgreat@bobsmail.com", "bobisgreat" )).to eq(@user)
    end

    it "should return nil if an existing user logs in with the correct email and incorrect password" do
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisgreat"})

      @user.save

      expect(User.authenticate_with_credentials("bobisgreat@bobsmail.com", "bobisnotgreat" )).to eq(nil)
    end

    it "should return nil if an existing user logs in with the incorrect email and correct password" do
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisgreat"})

      @user.save

      expect(User.authenticate_with_credentials("bobisnotgreat@bobsmail.com", "bobisgreat" )).to eq(nil)
    end

    it "should return the user if an existing user logs in with the correct email in upper or lower case and correct password" do
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisgreat"})

      @user.save

      expect(User.authenticate_with_credentials("boBisGreat@bobSmail.com", "bobisgreat" )).to eq(@user)
    end

    it "should return the user if an existing user logs in with the correct email with whitespaces and password" do
      @user = User.new({first_name: "Bob", last_name: "Bobsworth", email: "bobisgreat@bobsmail.com", password: "bobisgreat", password_confirmation: "bobisgreat"})

      @user.save

      expect(User.authenticate_with_credentials("   bobisgreat@bobsmail.com", "bobisgreat" )).to eq(@user)
    end
  end
end
