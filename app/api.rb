require 'grape'
require_relative 'services/locations-service'

class API < Grape::API
  format :json
  content_type :json, 'application/json'

  desc 'Find locations'
  get '/locations' do
    if params[:name]
      LocationsService.find(params[:name])
    else
      LocationsService.all
    end
  end
end
