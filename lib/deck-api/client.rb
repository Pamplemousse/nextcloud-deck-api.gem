# frozen_string_literal: true

require 'faraday'

module DeckAPI
  # Utility to build a client to communicate with the API of a Deck application.
  module Client
    # The URL path of the API.
    # @see https://deck.readthedocs.io/en/latest/API/#prequisited
    API_ENDPOINT = 'index.php/apps/deck/api/v1.0'

    # The HTTP headers required by the API of the Deck application.
    # @see https://deck.readthedocs.io/en/latest/API/#prequisited
    HEADERS = {
      'Content-Type' => 'application/json',
      'OCS-APIRequest' => 'true'
    }.freeze

    # Get a connection object to run requests with.
    # @param domain [String] The domain on which the Nextcloud instance with the Deck application is running.
    # @param username [String] The username of the user to connect with.
    # @param password [String] The password of this user.
    # @return [Faraday::Connection]
    def self.connection(domain, username, password, stubs = nil)
      url_base = "https://#{domain}/#{API_ENDPOINT}"

      Faraday.new(url: url_base, headers: HEADERS) do |builder|
        builder.use Faraday::Request::BasicAuthentication, username, password
        builder.adapter(:test, stubs) if ENV['APPLICATION_MODE'] == 'test'
      end
    end
  end

  # A default client built from environment variables.
  CLIENT = Client.connection(
    ENV['DECK_API_DOMAIN'],
    ENV['DECK_API_USERNAME'],
    ENV['DECK_API_PASSWORD']
  )
end
