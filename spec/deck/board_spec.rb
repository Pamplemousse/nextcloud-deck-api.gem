# frozen_string_literal: true

require 'deck/board'
require 'stubs/json/board'

module Deck
  describe 'Board' do
    describe 'deserialization from json' do
      it 'can instanciate a list of boards' do
        boards = Board.from_json LIST_OF_BOARDS_JSON

        expect(boards.size).to eq 1
        expect(boards[0].id).to eq 1
        expect(boards[0].title).to eq 'API test'
        expect(boards[0].stacks).to eq []
      end

      it 'can instanciate a single board' do
        board = Board.from_json SINGLE_BOARD_JSON

        expect(board.id).to eq 1
        expect(board.title).to eq 'API test'
        expect(board.stacks).to eq []
      end

      it 'can instanciate a single board containing stacks containing cards' do
        board = Board.from_json BOARD_WITH_STACKS_WITH_CARDS_JSON

        expect(board.stacks.size).to eq 1
        expect(board.stacks[0].id).to eq 2
        expect(board.stacks[0].title).to eq 'TODO'

        stack = board.stacks[0]

        expect(stack.cards.size).to eq 1
        expect(stack.cards[0].title).to eq 'do something'
        expect(stack.cards[0].description).to eq 'we really should be doing this thing'
      end
    end
  end
end
