require "spec_helper"

describe Api do
  let(:valid_user) { FactoryGirl.create(:user) }
  let(:invalid_user) { FactoryGirl.create(:user, password: "password", email: "invalid@email.com") }

  describe "get data" do
    subject { Api.new(valid_user) }

    it "return right response" do
      expect(subject.data.code).to eq 200
      expect(subject.data.response[:name]).to eq "Supernatural"
    end
  end
end
