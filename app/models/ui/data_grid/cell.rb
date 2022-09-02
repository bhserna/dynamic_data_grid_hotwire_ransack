module UI::DataGrid
  class Cell
    include ActiveModel::Model
    attr_accessor :row, :column

    def render
      template = row.template_for(column)

      if template
        template.call(row.record)
      else
        row.record.send(column)
      end
    end
  end
end
