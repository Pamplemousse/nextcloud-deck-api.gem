# frozen_string_literal: true

require 'base64'

require 'deck-api/client'

module DeckAPI
  describe 'Client' do
    describe 'connection' do
      before(:all) do
        @domain = 'domain.com'
        @username = 'username'
        @password = 'password'

        @stubs = Faraday::Adapter::Test::Stubs.new
        @client = Client.connection(@domain, @username, @password, @stubs)
      end

      it 'is a simple wrapper around Faraday' do
        expect(@client.class).to eq ::Faraday::Connection
      end

      it 'sets the domain properly' do
        expect(@client.url_prefix.to_s).to eq "https://#{@domain}/index.php/apps/deck/api/v1.0"
      end

      it 'sets the headers expected by the Deck API' do
        expect(@client.headers['Content-Type']).to eq 'application/json'
        expect(@client.headers['OCS-APIRequest']).to eq 'true'
      end

      it 'sets the proper authorization header on requests' do
        @stubs.get(Client::API_ENDPOINT) { [200, {}, ''] }

        authorization = @client.get.env.request_headers['Authorization']
        authentication_message = Base64.encode64("#{@username}:#{@password}").chomp

        expect(authorization).to eq "Basic #{authentication_message}"
      end
    end
  end
end
