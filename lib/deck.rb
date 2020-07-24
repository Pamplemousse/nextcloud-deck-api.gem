# frozen_string_literal: true

require 'dry-struct'

module Types
  include Dry.Types()
end

require 'deck/board'
require 'deck/card'
require 'deck/stack'
