# frozen_string_literal: true

require 'api'
require 'client'

module DeckAPI
  CLIENT = Client.connection(ENV['DECK_API_DOMAIN'],
                             ENV['DECK_API_USERNAME'],
                             ENV['DECK_API_PASSWORD'])

  VERSION = '0.0.1'
end
