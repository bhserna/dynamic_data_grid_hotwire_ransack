require "rails_helper"

module UI::DataGrid
  RSpec.describe Cell do
    let(:record) { build :product }
    let(:row) { Row.new(record: record) }

    subject { Cell.new(row: row, column: :name) }

    describe "#render" do
      it "without custom template" do
        allow(row).to receive(:template_for).with(:name) { nil }
        expect(subject.render).to eq record.name
      end

      it "with custom template" do
        template = ->(record) { record.name.upcase }
        allow(row).to receive(:template_for).with(:name) { template }
        expect(subject.render).to eq record.name.upcase
      end
    end
  end
end
