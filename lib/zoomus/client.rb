require 'httparty'
require 'jwt'
require 'json'

module Zoomus
  class Client

    include HTTParty
    include Actions::User
    include Actions::Meeting
    include Actions::Metrics
    include Actions::Webinar
    include Actions::Report
    include Actions::Recording

    base_uri 'https://api.zoom.us/v2'

    def initialize(*args)
      options = Utils.extract_options!(args)
      check_if_values_exist(options)
      self.class.default_params(
        :api_key    => options[:api_key],
        :api_secret => options[:api_secret]
      )
      self.class.default_timeout(1200)
    end

    def self.token
      hmac_secret = '$tixadmin'
      payload =  {
        'api_key': options[:api_key],
        'api_secret': options[:api_secret],
        'timeout': 1200
      }
      token = JWT.encode payload, hmac_secret, 'HS512'
      token
    end

    private 

    def check_if_values_exist(options)
      unless options[:api_key] && options[:api_secret]
        raise Utils.argument_error("Zoom: api_key and api_secret required")
      end
    end
  end
end
