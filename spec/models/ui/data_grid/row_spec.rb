require "rails_helper"

module UI::DataGrid
  RSpec.describe Row do
    let(:table) { Table.new }

    subject { described_class.new(table: table) }

    describe "#cells" do
      it "with no columns" do
        allow(table).to receive(:columns) { [] }
        expect(subject.cells).to be_empty
      end

      it "with one column" do
        allow(table).to receive(:columns) { [:name] }

        record = build(:product)
        subject.record = record

        expect(subject.cells.count).to eq 1

        cell = subject.cells.first
        expect_cell(cell, row: subject, column: :name)
      end

      it "with two columns" do
        allow(table).to receive(:columns) { [:name, :category] }

        record = build(:product)
        subject.record = record

        expect(subject.cells.count).to eq 2

        cell = subject.cells[0]
        expect_cell(cell, row: subject, column: :name)

        cell = subject.cells[1]
        expect_cell(cell, row: subject, column: :category)
      end

      def expect_cell(cell, row:, column:)
        expect(cell).to be_a Cell
        expect(cell.row).to eq row
        expect(cell.column).to eq column
      end
    end
  end
end
