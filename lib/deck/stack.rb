# frozen_string_literal: true

require 'dry-struct'
require 'json'

require 'deck/card'

module Deck
  # Represent a stack in the Deck application.
  # @see https://deck.readthedocs.io/en/latest/User_documentation_en/
  class Stack < Dry::Struct
    transform_keys(&:to_sym)

    attribute :id, Types::Integer
    attribute :cards, Types::Array.of(Card)
    attribute :title, Types::String

    # @param json [String] A serialized stack.
    # @return [Stack] A new instance of a {Stack} filled with the given data.
    def self.from_json(json)
      data = JSON.parse json

      if data.class == Array
        data.map do |datum|
          Stack.new(datum)
        end
      else
        Stack.new(data)
      end
    end
  end
end
