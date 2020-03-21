require 'csv'

class Player < ApplicationRecord
  NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
  VALIDATABLE_ATTRS = Player.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}

  validates_presence_of VALIDATABLE_ATTRS

  scope :order_by, ->(attr_name: nil, desc: nil) {
    return all if attr_name.blank? || desc.nil? || desc == '' || !valid_attr?(attr_name)
    order("#{attr_name} #{desc ? :desc : ''}")
  }

  scope :filter_by, ->(attr_name: nil, search_value: nil) {
    return all if attr_name.blank? || search_value.blank? || !valid_attr?(attr_name)
    where("#{attr_name} like ?", "%#{search_value.capitalize}%")
  }

  def self.valid_attr?(attr_name) 
    VALIDATABLE_ATTRS.include?(attr_name)
  end
  
  def self.to_csv(sort_params, filter_params)
    CSV.generate(headers: true) do |csv|  
      csv << VALIDATABLE_ATTRS

      Player.filter_by(filter_params)
        .order_by(sort_params)
        .each do |player|
          csv << VALIDATABLE_ATTRS.map{ |attr| player.send(attr) }
      end
    end
  end

  def self.generate_csv(sort_params, filter_params)
    destination = "#{Rails.root}/app/tmp"
    CSV.open(destination, "wb", {headers: true}) do |csv|  
      csv << VALIDATABLE_ATTRS
      Player.filter_by(filter_params)
        .order_by(sort_params)
        .each do |player|
          csv << VALIDATABLE_ATTRS.map{ |attr| player.send(attr) }
      end
    end
    return destination
  end
end
