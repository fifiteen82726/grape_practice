#app/api/twitter/api/api.rb

require 'grape'
require 'grape-swagger'

module Twitter
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api
    add_swagger_documentation

    resource :statuses do
      desc 'Return a public timeline.'

      get :public_timeline do
        Status.limit(20)
      end


    end
  end
end