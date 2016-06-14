#app/api/twitter/api/api.rb

require 'grape'
require 'grape-swagger'

module Twitter
  class API < Grape::API
    
    format :json
    
    add_swagger_documentation(
    basd_path: "/v1",
    mount_path: 'doc',
    info: {
      title: 'Twitter API'
    },
    markdown: false,
    hide_documentation_path: true,
    hide_format: true,
    include_base_url: true
    )


    resource :statuses do
      desc 'Return a public timeline.'
      get :public_timeline do
        Status.limit(20)
      end

      desc 'Get Smile'
      get '/info/smile.json' do
        {
          :smail => {
            :say => (":)")
          }
        }
      end




    end
  end
end