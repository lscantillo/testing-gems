module LogManager
  class LogService < ApplicationService
    attr_reader :message

    def initialize(message)
      @message = message
    end
    
    def call
      @data = @message + 'call'
    end

    def test
      @data = @message + 'test'
    end

    def test_service
      if @data[:username] && @auth
        if decoded_token
          username = decoded_token[0]['username']
          if username == @data[:username]
            true
          else
            false
          end
        else
          false
        end
      else
        false
      end
    end
  end
end
