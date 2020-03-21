module Inputs
  class FilterAttributes < Types::BaseInputObject
    description "Filtering attributes for creating CSV"
    argument :attr_name, String, 'The attribute name by which players will be filtered', required: true
    argument :search_value, String, 'search value of the attribute', required: true
  end
end
