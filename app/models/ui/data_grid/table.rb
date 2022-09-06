module UI::DataGrid
  class Table
    include ActiveModel::Model
    attr_accessor :records, :ransack_search, :pagy
    alias_method :q, :ransack_search

    def column(name, &template)
      columns << name
      templates[name] = template
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

    def template_for(column)
      templates[column]
    end

    private

    def templates
      @templates ||= {}
    end
  end
end
