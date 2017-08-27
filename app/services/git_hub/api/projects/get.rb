module GitHub
  module Api
    module Projects
      class Get < Base
        ADDRESS = '/repos'.freeze

        def initialize(owner, repo)
          @uri = get_uri(owner, repo)
        end

        private

        def get_uri(owner, repo)
          url = "#{GitHub::Api::Settings::ADDRESS}#{ADDRESS}/#{owner}/#{repo}"
          URI.parse(url)
        end

        def parse(response)
          JSON.parse(response.body)
        end
      end
    end
  end
end