module GitHub
  module Api
    module Users
      class Get < GitHub::Api::Base
        ADDRESS = '/users'.freeze

        def initialize(login)
          @uri = get_uri(login)
        end

        private

        def get_uri(login)
          url = "#{GitHub::Api::Settings::ADDRESS}#{ADDRESS}/#{login}"
          URI.parse(url)
        end

        def parse(response)
          JSON.parse(response.body)
        end
      end
    end
  end
end