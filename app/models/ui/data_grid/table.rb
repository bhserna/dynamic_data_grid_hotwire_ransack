module UI::DataGrid
  class Table
    include ActiveModel::Model
    attr_accessor :records, :ransack_search, :pagy
    alias_method :q, :ransack_search

    def column(name)
      columns << name
      nil
    end

    def columns
      @columns ||= []
    end

    def rows
      records.map do |record|
        Row.new(table: self, record: record)
      end
    end
  end
end
