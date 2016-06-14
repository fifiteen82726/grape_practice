#app/api/twitter/api/api.rb

require 'grape'
require 'grape-swagger'

module Twitter
  class API < Grape::API
    
    format :json
    
    add_swagger_documentation(
    basd_path: "localhost:3000/v1",
    mount_path: 'doc',
    info: {
      title: 'Twitter API'
    },
    markdown: false
    )
    

    resource :statuses do
      desc 'Return a public timeline.'

      get :public_timeline do
        Status.limit(20)
      end


    end
  end
end