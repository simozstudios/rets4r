module RETS4R
  class Client
    class ObjectHeader < Hash
      include Net::HTTPHeader
      def initialize(raw_header)
        initialize_http_header( raw_header )
      end
    end
    # Represents a RETS object (as returned by the get_object) transaction.
    class DataObject
      attr_accessor :header, :data

      alias :type :header
      alias :info :type

      def initialize(headers, data)
	    #Testing SIMOZ logging to find header data
		@headers = headers
		Rails.logger.debug("SIMOZ initialize headers Debug: #{@headers.inspect}")
		#End test
        @header = ObjectHeader.new(headers)
        @data = data
		#Testing SIMOZ logging to find header data
		Rails.logger.debug("SIMOZ headers after dataobject initialize and object header initalize script : #{@header.inspect}")
		#End test
      end

      def success?
          return true if self.data
          return false
      end
    end
  end
end
