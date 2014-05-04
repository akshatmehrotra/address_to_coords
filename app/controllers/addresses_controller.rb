require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates
    # @address = "the corner of Foster and Sheridan"

    @url_safe_address = URI.encode(params[:user_address])

    # Your code goes here.
    url = "http://maps.googleapis.com/maps/api/geocode/json?address="+@url_safe_address+"&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)

    first = parsed_data["results"][0]
    geometry=first["geometry"]
    location = geometry["location"]
    @latitude = location["lat"]
    @longitude = location["lng"]
  end
end
