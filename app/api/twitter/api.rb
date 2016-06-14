require 'grape'


module Twitter
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api

    resource :statuses do
      desc 'Return a public timeline.'
      get :hahaha do
        # Status.limit(20)
        {:say => 'hahaha'}
      end


      get :public_timeline do
        Status.limit(20)
      end


    end
  end
end