# frozen_string_literal: true

require 'faraday'

module DeckAPI
  module Client
    API_ENDPOINT = 'index.php/apps/deck/api/v1.0'
    HEADERS = { 'Content-Type' => 'application/json',
                'OCS-APIRequest' => 'true' }.freeze

    def self.connection(domain, username, password, stubs = nil)
      url_base = "https://#{domain}/#{API_ENDPOINT}"

      Faraday.new(url: url_base, headers: HEADERS) do |builder|
        builder.use Faraday::Request::BasicAuthentication, username, password
        builder.adapter(:test, stubs) if ENV['APPLICATION_MODE'] == 'test'
      end
    end
  end

  CLIENT = Client.connection(ENV['DECK_API_DOMAIN'],
                             ENV['DECK_API_USERNAME'],
                             ENV['DECK_API_PASSWORD'])
end
