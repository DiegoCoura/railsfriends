require "rails_helper"

class UserTest < ActiveSupport::TestCase
  describe User, type: :model do
    subject do
      described_class.new(email: "usertest@example.com", password: "password")
    end
  
    it "is valid with valid attributes" do
      # subject should be a valid Friend and should be instantianted
      expect(subject).to be_valid
    end
  
    it "is not valid without a email" do
      subject.email = nil
      # I want this instantiation of subject to fail
      expect(subject).not_to be_valid
    end
  end
end
