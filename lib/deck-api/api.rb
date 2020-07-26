# frozen_string_literal: true

require 'deck'

module DeckAPI
  # Features to interact with a Deck application via its API.
  module API
    # @see https://deck.readthedocs.io/en/latest/API/#boards
    module Boards
      # The path complement to be added to the {Client::API_ENDPOINT} to make the endpoint for {Deck::Board}s.
      # @return [String]
      def self.endpoint
        'boards'
      end

      def self.get
        Deck::Board.from_json CLIENT.get(endpoint).body
      end
    end

    # @see https://deck.readthedocs.io/en/latest/API/#stacks
    module Stacks
      # The path complement to be added to the {Client::API_ENDPOINT} to make the endpoint for {Deck::Stack}s.
      # @param board_id [Integer]
      # @return [String]
      def self.endpoint(board_id)
        board_endpoint = "#{Boards.endpoint}/#{board_id}"
        "#{board_endpoint}/stacks"
      end

      # @param board_id [Integer] The id of the board to get the {::Deck::Stack}s from.
      def self.get(board_id)
        endpoint = endpoint(board_id)
        Deck::Stack.from_json CLIENT.get(endpoint).body
      end
    end

    # @see https://deck.readthedocs.io/en/latest/API/#cards
    module Cards
      # The path complement to be added to the {Client::API_ENDPOINT} to make the endpoint for {Deck::Card}s.
      # @param board_id [Integer]
      # @param stack_id [Integer]
      # @return [String]
      def self.endpoint(board_id, stack_id)
        stack_endpoint = "#{Stacks.endpoint(board_id)}/#{stack_id}"
        "#{stack_endpoint}/cards"
      end

      # @param card [::Deck::Card] The card to create.
      #   Requires the fields `board_id` and `stack_id` to be set to know where to add it.
      def self.create(card)
        endpoint = endpoint(card.board_id, card.stack_id)
        CLIENT.post(endpoint, card.to_json)
      end
    end
  end
end
