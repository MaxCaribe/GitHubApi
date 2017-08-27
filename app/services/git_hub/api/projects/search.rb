module GitHub
  module Api
    module Projects
      class Search < Base
        ADDRESS = '/search/repositories'.freeze

        def initialize(search_for)
          @uri = get_uri(search_for)
        end

        private

        def get_uri(param)
          url = "#{GitHub::Api::Settings::ADDRESS}#{ADDRESS}?q=#{param}"
          URI.parse(url)
        end

        def parse(response)
          JSON.parse(response.body)['items']
        end
      end
    end
  end
end