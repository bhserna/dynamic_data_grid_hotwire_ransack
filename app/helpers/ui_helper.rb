module UIHelper
  def table_with(options)
    table = UI::DataGrid::Table.new(options)
    yield table
    render table
  end

  def filters_with(options)
    filters = UI::DataGrid::Filters.new(options)
    yield filters
    render filters
  end
end
