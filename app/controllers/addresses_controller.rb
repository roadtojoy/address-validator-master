class AddressesController < ApplicationController
  def index
    render 'new'
  end

  def new; end

  def create
    @address = AddressParser.new(address_params).parse

    if @address && @address.save
      flash.now[:success] = "Address saved successfully!"
    else
      flash.now[:warning] = "Address not saved. Please try again."
    end

    render 'new'
  end

  private

  def address_params
    params.permit(:street_address, :city, :state, :zip_code)
  end
end
