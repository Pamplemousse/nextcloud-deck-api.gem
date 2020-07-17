# frozen_string_literal: true

require 'dry-struct'
require 'json'

require 'deck/stack'

module Types
  include Dry.Types()
end

class Board < Dry::Struct
  transform_keys(&:to_sym)

  attribute :id, Types::Integer
  attribute :title, Types::String
  attribute :stacks, Types::Array.of(::Stack)

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
