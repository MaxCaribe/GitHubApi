module GitHub
  module Api
    class Base < BaseService
      def initialize(*args)
        @uri = get_uri(args)
      end

      def perform
        response = Net::HTTP.get_response(@uri)
        if response.code.to_i <= 400
          Results::Ok.new(parse(response))
        else
          Results::Error.new(response.message)
        end
      end

      protected

      def get_uri(*args)
        raise NotImplementedError
      end

      def parse(*args)
        raise NotImplementedError
      end
    end
  end
end