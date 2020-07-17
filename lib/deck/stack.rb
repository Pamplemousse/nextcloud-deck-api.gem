# frozen_string_literal: true

require 'dry-struct'
require 'json'

require 'deck/card'

module Types
  include Dry.Types()
end

class Stack < Dry::Struct
  transform_keys(&:to_sym)

  attribute :id, Types::Integer
  attribute :cards, Types::Array.of(::Card)
  attribute :title, Types::String

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
