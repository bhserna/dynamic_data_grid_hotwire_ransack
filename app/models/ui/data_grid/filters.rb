module UI::DataGrid
  class Filters
    include ActiveModel::Model
    attr_accessor :ransack_search
    alias_method :q, :ransack_search

    def search_field(name)
      inputs << Inputs::SearchField.new(name: name)
      nil
    end

    def select(name, options)
      inputs << Inputs::Select.new(name: name, options: options)
      nil
    end

    def inputs
      @inputs ||= []
    end
  end
end