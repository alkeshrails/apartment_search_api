class Apartment < ApplicationRecord
  def self.search(params)
    return Apartment.all if params.slice(:min_price, :max_price, :min_sqm, :max_sqm, :number_of_bedrooms).empty?

    apartments = Apartment.where(price: (params[:min_price]..params[:max_price]), sqm: (params[:min_sqm]..params[:max_sqm]))
    apartments = apartments.where(number_of_bedrooms: params[:number_of_bedrooms]) if params[:number_of_bedrooms].present?
    apartments
  end
end
