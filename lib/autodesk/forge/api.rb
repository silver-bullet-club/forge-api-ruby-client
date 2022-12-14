require 'net/http'
require 'json'
require 'uri'

module Autodesk
  class Forge
    class API
      private
        def http_client
          return @http_client if @http_client

          @http_client = Net::HTTP.new('developer.api.autodesk.com', 443)
          @http_client.use_ssl = true

          @http_client
        end

        def get_request(path)
          headers = { Authorization: "Bearer #{@credentials['access_token']}"}

          http_client.get(path, headers)
        end
    end
  end
end