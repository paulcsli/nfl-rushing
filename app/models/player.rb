require 'CSV'

class Player < ApplicationRecord
  NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
  VALIDATABLE_ATTRS = Player.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}

  validates_presence_of VALIDATABLE_ATTRS

  scope :filtered_by, ->(attr_name, prefix) { where("#{attr_name} like ?", "%#{prefix.capitalize}%") }
  scope :sorted_by, ->(attr_name, desc) { order("#{attr_name} #{desc ? 'DESC' : 'ASC'}" ) }

  def self.to_csv(sort_params, filter_params)
    CSV.generate(headers: true) do |csv|
      csv << VALIDATABLE_ATTRS

      filtered_by(filter_params[:attr], filter_params[:prefix])
        .sorted_by(sort_params[:attr], sort_params[:desc])
        .each do |player|
          csv << VALIDATABLE_ATTRS.map{ |attr| player.send(attr) }
      end
    end
  end
end
