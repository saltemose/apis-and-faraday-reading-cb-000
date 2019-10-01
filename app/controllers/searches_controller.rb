class SearchesController < ApplicationController
  def search
  end

  def foursquare
    Faraday.get'hhtps:://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'client_id'
      req.params['client_secret'] = 'client_secret'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
  end
end
