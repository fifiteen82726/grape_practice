#app/api/twitter/api/api.rb

require 'grape'
require 'grape-swagger'

module Twitter
  class API < Grape::API
    
    format :json
    before do
     # headers['Access-Control-Allow-Origin'] = header['Access-Control-Request-Method']='*'
      #headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
    
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

    add_swagger_documentation(
      basd_path: "/v1",
      mount_path: 'doc',
      info: {
        title: 'Twitter API',
        description: "A description of the API."
        },
        hide_documentation_path: true,
        hide_format: true,
        include_base_url: true
        )



  end
end