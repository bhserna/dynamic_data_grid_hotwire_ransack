module UIHelper
  def table_with(options)
    table = UI::DataGrid::Table.new(options)
    yield table
    render table
  end
end
