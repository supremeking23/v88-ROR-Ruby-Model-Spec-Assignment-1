require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # it 'should not save if first_name field is blank' do
  #   user = User.new(
  #     first_name: 'Mitsuha',
  #     last_name: 'Miyamizu',
  #     email: 'mitsuhamiyamizu@gmail.com'
  #   )

  #   expect(user).to be_valid
  # end

  context 'With valid attributes' do
    it 'should save' do
      user = User.new(
            first_name: 'Mitsuha',
            last_name: 'Miyamizu',
            email: 'mitsuhamiyamizu@gmail.com'
      )
      expect(user).to be_valid
    end
  end

  context 'With invalid attributes' do
    it 'should not save if first_name field is blank' do
      user = User.new(
        first_name: '', 
        last_name: 'chang', 
        email: 'schang@codingdojo.com'
      )
      expect(user).to be_invalid
    end

    it "should not save if last_name field is blank" do
      user = User.new(
        first_name: 'Mitsuha',
        last_name: '',
        email: 'mitsuhamiyamizu@gmail.com'
      )
      expect(user).to be_invalid
    end
  end

  

 context 'for email testing' do
    it "should not save if email already exists" do
      find_by_email = User.find_by(email: "mitsuhamiyamizu@gmail.com")
      expect(find_by_email).to be_nil
    end

    it "should not save if invalid email format" do
      user = User.new(
        first_name: 'Mitsuha',
        last_name: 'Miyamizu',
        email: 'mitsuhamiyamizu'
      )
      expect(user).to be_invalid
    end

  end
end
