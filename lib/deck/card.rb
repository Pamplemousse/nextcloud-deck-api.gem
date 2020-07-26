# frozen_string_literal: true

require 'dry-struct'
require 'json'

module Deck
  # Represent a card in the Deck application.
  # @see https://deck.readthedocs.io/en/latest/User_documentation_en/
  class Card < Dry::Struct
    transform_keys(&:to_sym)

    attribute :description, Types::String
    attribute :title, Types::String

    attribute :board_id, Types::Integer.meta(omittable: true)
    attribute :stack_id, Types::Integer.meta(omittable: true)

    # @return [String] The result of serializing the {Card}.
    def to_json(_ = nil)
      { title: title,
        description: description }.to_json
    end
  end
end
