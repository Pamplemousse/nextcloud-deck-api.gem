# frozen_string_literal: true

require 'deck'

module DeckAPI
  module API
    module Boards
      def self.endpoint
        'boards'
      end

      def self.get
        Deck::Board.from_json CLIENT.get(endpoint).body
      end
    end

    module Stacks
      def self.endpoint(board_id)
        board_endpoint = "#{Boards.endpoint}/#{board_id}"
        "#{board_endpoint}/stacks"
      end

      def self.get(board_id)
        endpoint = endpoint(board_id)
        Deck::Stack.from_json CLIENT.get(endpoint).body
      end
    end

    module Cards
      def self.endpoint(board_id, stack_id)
        stack_endpoint = "#{Stacks.endpoint(board_id)}/#{stack_id}"
        "#{stack_endpoint}/cards"
      end

      def self.create(card)
        endpoint = endpoint(card.board_id, card.stack_id)
        CLIENT.post(endpoint, card.to_json)
      end
    end
  end
end
