module API
  class Root < Grape::API
    prefix 'api'
    mount API::V1::Root
    # mount API::V2::Root (next version)
  end
end



module API
  module V1
    class Root < Grape::API
      mount API::V1::Posts
      mount API::V1::Authors
    end
  end
end