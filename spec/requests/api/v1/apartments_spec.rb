require 'rails_helper'

RSpec.describe 'Api::V1::Apartments', type: :request do
  describe 'GET /index' do
    it 'returns status code 200' do
      get '/api/v1/apartments'

      expect(response).to have_http_status(200)
    end

    context 'with out filters' do
      let!(:apartments) { create_list(:apartment, 5) }
      it 'returns all apartments' do
        get '/api/v1/apartments'

        json = JSON.parse(response.body)
        expect(json.size).to eq(5)
      end
    end

    context 'with filters' do
      let!(:apartment1) { create(:apartment, price: 1000, sqm: 200, number_of_bedrooms: 2) }
      let!(:apartment2) { create(:apartment, price: 5000, sqm: 500, number_of_bedrooms: 4) }
      it 'searches by min_price' do
        get '/api/v1/apartments', params: { min_price: '2000' }
        json = JSON.parse(response.body)
        expect(json.map { |apartment| apartment['id'] }).to include(apartment2.id)
      end

      it 'searches by max_price' do
        get '/api/v1/apartments', params: { max_price: '2000' }
        json = JSON.parse(response.body)
        expect(json.map { |apartment| apartment['id'] }).to include(apartment1.id)
      end

      it 'searches by min_sqm' do
        get '/api/v1/apartments', params: { min_sqm: '250' }
        json = JSON.parse(response.body)
        expect(json.map { |apartment| apartment['id'] }).to include(apartment2.id)
      end

      it 'searches by max_sqm' do
        get '/api/v1/apartments', params: { max_sqm: '250' }
        json = JSON.parse(response.body)
        expect(json.map { |apartment| apartment['id'] }).to include(apartment1.id)
      end

      it 'searches by number_of_bedrooms' do
        get '/api/v1/apartments', params: { number_of_bedrooms: '2' }
        json = JSON.parse(response.body)
        expect(json.map { |apartment| apartment['id'] }).to include(apartment1.id)
      end

      it 'searches by min_price, max_price, min_sqm, max_sqm, number_of_bedrooms' do
        get '/api/v1/apartments', params: {
          min_price: '500', max_price: '1500',
          min_sqm: '100', max_sqm: '300',
          number_of_bedrooms: '2'
        }
        json = JSON.parse(response.body)
        expect(json.map { |apartment| apartment['id'] }).to include(apartment1.id)
      end
    end
  end
end
