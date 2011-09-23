require 'oauth2'
module Sorcery
  module Controller
    module Submodules
      module External
        module Protocols
          module Oauth2
            def oauth_version
              "2.0"
            end
          
            def authorize_url(options = {})
              client = ::OAuth2::Client.new(@key, @secret, {:site => @site}.merge!(options))
              client.web_server.authorize_url(:redirect_uri => @callback_url, :scope => @scope)
            end
          
            def get_access_token(args)
              client = ::OAuth2::Client.new(@key, @secret, :site => @site)
              client.web_server.get_access_token(args[:code], :redirect_uri => @callback_url)
            end
          end
        end
      end
    end
  end
end