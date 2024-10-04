require "rails_helper"

class FriendTest < ActiveSupport::TestCase  
  describe Friend, type: :model do
    before(:each) do
      User.create!(email: "usertest@example.com", password: "password")
    end
  
    subject do
      described_class.new(first_name: "John", last_name: "Doe", email: "Pv6Vd@example.com", phone: "1234567890", twitter: "john_doe", user_id: User.last.id)
    end
  
    it "is valid with valid attributes" do
      # subject should be a valid Friend and should be instantianted
      expect(subject).to be_valid
    end
  
    it "is not valid without a first_name" do
      subject.first_name = nil
      # I want this instantiation of subject to fail
      expect(subject).not_to be_valid
    end
  
    it "is not valid without an user_id" do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end
  
    it "check first_name" do
      expect(subject.first_name).to match(/John/)
    end
  end
end
