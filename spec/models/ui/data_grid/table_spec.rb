require "rails_helper"

module UI::DataGrid
  RSpec.describe Table do
    describe "#column" do
      it "receives a name and saves it into columns" do
        subject.column(:name)
        expect(subject.columns).to eq [:name]

        subject.column(:category)
        expect(subject.columns).to eq [:name, :category]
      end
    end

    describe "#rows" do
      it "with no records" do
        subject.records = []
        expect(subject.rows).to be_empty
      end

      it "with one record" do
        record = build(:product)
        subject.records = [record]
        expect(subject.rows.count).to eq 1

        row = subject.rows.first
        expect_row(row, table: subject, record: record)
      end

      it "with two records" do
        record1 = build(:product)
        record2 = build(:product)
        subject.records = [record1, record2]
        expect(subject.rows.count).to eq 2

        row = subject.rows[0]
        expect_row(row, table: subject, record: record1)

        row = subject.rows[1]
        expect_row(row, table: subject, record: record2)
      end

      def expect_row(row, table:, record:)
        expect(row).to be_a Row
        expect(row.table).to eq table
        expect(row.record).to eq record
      end
    end
  end
end
