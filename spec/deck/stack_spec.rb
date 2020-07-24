# frozen_string_literal: true

require 'deck/stack'
require 'stubs/json/stack'

module Deck
  describe 'Stack' do
    describe 'deserialization from json' do
      it 'can instanciate a list of stacks' do
        stacks = Stack.from_json LIST_OF_STACKS_JSON

        expect(stacks.size).to eq 1
        expect(stacks[0].id).to eq 2
        expect(stacks[0].title).to eq 'TODO'
        expect(stacks[0].cards).to eq []
      end

      it 'can instanciate a single stack' do
        stack = Stack.from_json SINGLE_STACK_JSON

        expect(stack.id).to eq 2
        expect(stack.title).to eq 'TODO'
        expect(stack.cards).to eq []
      end

      it 'can instanciate a single stack containing cards' do
        stack = Stack.from_json STACK_WITH_CARDS_JSON

        expect(stack.cards.size).to eq 1
        expect(stack.cards[0].title).to eq 'do something'
        expect(stack.cards[0].description).to eq 'we really should be doing this thing'
      end
    end
  end
end
