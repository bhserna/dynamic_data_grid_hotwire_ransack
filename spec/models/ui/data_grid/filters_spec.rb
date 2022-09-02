require "rails_helper"

module UI::DataGrid
  RSpec.describe Filters do
    describe "#search_field" do
      it "saves the method name and its attributes" do
        subject.search_field :name_cont
        inputs = subject.inputs
        input = inputs.first

        expect(inputs.count).to eq 1
        expect(input).to be_a Filters::Inputs::SearchField
        expect(input.name).to eq :name_cont
      end
    end

    describe "#select" do
      it "saves the method name and its attributes" do
        subject.select :category_eq, ["category1", "category2"]
        inputs = subject.inputs
        input = inputs.first

        expect(inputs.count).to eq 1
        expect(input).to be_a Filters::Inputs::Select
        expect(input.name).to eq :category_eq
        expect(input.options).to eq ["category1", "category2"]
      end
    end
  end
end