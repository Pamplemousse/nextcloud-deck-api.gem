# frozen_string_literal: true

# Fail to load if the necessary environment variables are absent.
missing_variables =
  ['DECK_API_DOMAIN', 'DECK_API_USERNAME', 'DECK_API_PASSWORD']
  .select { |variable| ENV[variable].nil? }
  .to_a
unless missing_variables.empty?
  message = "nextcloud-deck-api is expecting the following environment variables: #{missing_variables.to_a.join(', ')}"
  raise message
end

require 'deck'
require 'deck-api/api'
require 'deck-api/client'
require 'deck-api/version'
