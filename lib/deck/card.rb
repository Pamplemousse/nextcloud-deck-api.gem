# frozen_string_literal: true

require 'dry-struct'
require 'json'

module Deck
  class Card < Dry::Struct
    transform_keys(&:to_sym)

    attribute :description, Types::String
    attribute :title, Types::String

    attribute :board_id, Types::Integer.meta(omittable: true)
    attribute :stack_id, Types::Integer.meta(omittable: true)

    def to_json(_ = nil)
      { title: title,
        description: description }.to_json
    end
  end
end
