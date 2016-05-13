require "spec_helper"

describe UserAuthenticator do
  let(:valid_user) { FactoryGirl.create(:user) }
  let(:invalid_user) { FactoryGirl.create(:user, password: "password", email: "invalid@email.com") }

  describe "authenticate" do
    subject { UserAuthenticator.new(valid_user) }

    it "authenticates with success" do
      expect(subject.authenticate(valid_user.password)).to eql valid_user
    end

    describe "invalid password" do
      subject { UserAuthenticator.new(invalid_user) }

      it "does not authenticate with invalid password" do
        expect(subject.authenticate(invalid_user.password)).to be(false)
      end
    end

    describe "noexistent user" do
      subject { UserAuthenticator.new(nil) }

      it "does not authenticate with invalid password" do
        expect(subject.authenticate("invalid")).to be(false)
      end
    end
  end
end
