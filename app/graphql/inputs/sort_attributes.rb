module Inputs
  class SortAttributes < Types::BaseInputObject
    description "Sorting attributes for creating CSV"
    argument :attr_name, String, 'The attribute name by which players will be sorted', required: true
    argument :desc, Boolean, 'Sort descendingly or ascendingly', required: true
  end
end
