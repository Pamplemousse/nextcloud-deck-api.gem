# frozen_string_literal: true

require 'api'
['board', 'stack'].map do |e|
  require "stubs/json/#{e}"
end

describe 'DeckAPI' do
  before(:all) do
    @stubs = Faraday::Adapter::Test::Stubs.new
    DeckAPI::CLIENT = Client.connection('domain.com',
                                        'username',
                                        'password',
                                        @stubs)
  end

  describe 'Boards' do
    before(:all) do
      @board_endpoint = DeckAPI::Boards.endpoint
    end

    it 'has an endpoint' do
      expect(@board_endpoint).to eq 'boards'
    end

    describe 'get' do
      it 'creates `Board`s from the received data' do
        @stubs.get("#{Client::API_ENDPOINT}/#{@board_endpoint}") { [200, {}, LIST_OF_BOARDS_JSON] }

        boards = DeckAPI::Boards.get

        expect(boards.size).to eq 1
        expect(boards[0].class).to eq Board
      end
    end
  end

  describe 'Stacks' do
    before(:all) do
      @board_id = 42
      @stacks_endpoint = DeckAPI::Stacks.endpoint @board_id
    end

    it 'has an endpoint' do
      expect(@stacks_endpoint).to eq "boards/#{@board_id}/stacks"
    end

    describe 'get' do
      it 'creates `Stack`s from the received data' do
        @stubs.get("#{Client::API_ENDPOINT}/#{@stacks_endpoint}") { [200, {}, LIST_OF_STACKS_JSON] }

        stacks = DeckAPI::Stacks.get @board_id

        expect(stacks.size).to eq 1
        expect(stacks[0].class).to eq Stack
      end
    end
  end

  describe 'Cards' do
    before(:all) do
      @board_id = 42
      @stack_id = 84
      @cards_endpoint = DeckAPI::Cards.endpoint(@board_id, @stack_id)
    end

    it 'has an endpoint' do
      expect(@cards_endpoint).to eq "boards/#{@board_id}/stacks/#{@stack_id}/cards"
    end

    describe 'create' do
      it 'sends a creation request for a card containing the relevant data' do
        @stubs.post("#{Client::API_ENDPOINT}/#{@cards_endpoint}") { [200, {}, ''] }

        card = Card.new(title: 'a title',
                        description: 'some descriptive text',
                        board_id: @board_id,
                        stack_id: @stack_id)

        http = DeckAPI::Cards.create card

        expect(http.env.request_body).to eq card.to_json
      end
    end
  end
end
