# frozen_string_literal: true

require 'dry-struct'
require 'json'

require 'deck/stack'

module Deck
  # Represent a board in the Deck application.
  # @see https://deck.readthedocs.io/en/latest/User_documentation_en/
  class Board < Dry::Struct
    transform_keys(&:to_sym)

    attribute :id, Types::Integer
    attribute :title, Types::String
    attribute :stacks, Types::Array.of(Stack)

    # @param json [String] A serialized board.
    # @return [Board] A new instance of a {Board} filled with the given data.
    def self.from_json(json)
      data = JSON.parse json

      if data.class == Array
        data.map do |datum|
          Board.new(datum)
        end
      else
        Board.new(data)
      end
    end
  end
end
