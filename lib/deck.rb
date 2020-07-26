# frozen_string_literal: true

require 'dry-struct'

# The representation of Deck entities.
module Deck
  # Allow typing for {https://rubydoc.info/gems/dry-struct/Dry/Struct Dry::Struct}s
  module Types
    include Dry.Types()
  end
end

require 'deck/board'
require 'deck/card'
require 'deck/stack'
