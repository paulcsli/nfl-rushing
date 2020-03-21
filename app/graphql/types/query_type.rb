module Types
  class QueryType < Types::BaseObject
    field :csv, String, null: false do
      description "Generate a CSV based on attributes"
      argument :sort_attrs, Inputs::SortAttributes, required: false
      argument :filter_attrs, Inputs::FilterAttributes, required: false
    end

    def csv(sort_attrs: {}, filter_attrs: {})
      Player.generate_csv(sort_attrs, filter_attrs)
    end
  end
end
