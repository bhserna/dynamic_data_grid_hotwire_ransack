module UI::DataGrid::Filters::Inputs
  class Select
    include ActiveModel::Model
    attr_accessor :name, :options
  end
end