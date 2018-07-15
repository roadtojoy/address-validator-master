class Address < ApplicationRecord
  validates_presence_of :house_number, :street_name, :city, :state, :zip_5
  validates :zip_5, numericality: { greater_than_or_equal_to: 10000, less_than_or_equal_to: 99999, message: 'Please enter a valid US zipcode (5 digits)'}

  def to_s
    street_address = [house_number, street_predirection, street_name, street_type, street_postdirection, unit_type, unit_number].compact.join(" ")
    "#{street_address}, #{city}, #{state} #{zip_5}"
  end

  def self.states
    %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
  end

end
