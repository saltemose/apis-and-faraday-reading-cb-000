class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get'hhtps:://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'N02F4XVPDVAALJ0RQSSTK2BIR5TVSMHYGXR204YRX00H3CAK'
      req.params['client_secret'] = '0BJ3DNAVJWPEBWJNCRH13XJZTHZGIBM3FCMLWQMD0IMK4FDY'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
      req.options.timeout = 0
    end
    body = JSON.parse(@resp.body)
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
