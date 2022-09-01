require "rails_helper"

RSpec.describe UI::Table do
  describe "#column" do
    it "receives a name and saves it into columns" do
      subject.column(:name)
      expect(subject.columns).to eq [:name]

      subject.column(:category)
      expect(subject.columns).to eq [:name, :category]
    end
  end
end
