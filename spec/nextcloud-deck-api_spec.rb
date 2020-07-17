# frozen_string_literal: true

require 'nextcloud-deck-api'

describe 'DeckAPI' do
  it 'has a version' do
    version = DeckAPI::VERSION
    expect(version).to eq '0.0.1'
  end

  it 'is polite' do
    message = DeckAPI.hi
    expect(message).to eq 'Hello world!'
  end
end
