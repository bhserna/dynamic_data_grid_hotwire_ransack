module UI::DataGrid
  class Row
    include ActiveModel::Model
    attr_accessor :table, :record

    def cells
      table.columns.map do |column|
        Cell.new(row: self, column: column)
      end
    end
  end
end
