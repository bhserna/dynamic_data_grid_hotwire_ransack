module UI::DataGrid
  class Cell
    include ActiveModel::Model
    attr_accessor :row, :column

    def render
      row.record.send(column)
    end
  end
end
