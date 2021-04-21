class Api::V1::ApartmentsController < ApplicationController
  def index
    render json: Apartment.search(params), status: :ok
  end
end
