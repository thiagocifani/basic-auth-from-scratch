require "spec_helper"

describe TvShow do
  let(:tv_show) { OpenStruct.new(code: 200, response: {name: "Supernatural", category: "Drama"}) }

  describe "get data" do
    subject { TvShow.new(tv_show) }

    it "return right response" do
      expect(subject.name).to eq "Supernatural"
      expect(subject.category).to eq "Drama"
    end
  end
end
