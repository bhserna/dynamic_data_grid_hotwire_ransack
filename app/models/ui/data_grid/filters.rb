module UI::DataGrid
  class Filters
    include ActiveModel::Model
    attr_accessor :ransack_search
    alias_method :q, :ransack_search
  end
end