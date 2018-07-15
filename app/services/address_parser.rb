class AddressParser
  attr_accessor :street_address, :city, :state, :zip_code

  def initialize(params)
    params.each { |key, value| send "#{key}=", value }
  end

  def parse
    parsed_address = StreetAddress::US.parse(combined_address_string)

    if parsed_address && valid_address?

        address = Address.new(
          house_number: parsed_address.number,
          street_name: parsed_address.street,
          street_type: parsed_address.street_type,
          street_predirection: parsed_address.prefix,
          street_postdirection: parsed_address.suffix,
          unit_number: parsed_address.unit,
          unit_type: parsed_address.unit_prefix,

          city: city,
          state: state,
          zip_5: zip_code
        )

        return address
    end

    nil
  end

  def combined_address_string
    "#{street_address}, #{city}, #{state}, #{zip_code}"
  end

  def valid_address?
    geocoded = Geocoder.search(combined_address_string).first
    geocoded && !geocoded.partial_match
  end
end
