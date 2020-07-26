# frozen_string_literal: true

require 'nextcloud-deck-api'

describe 'DeckAPI' do
  it 'has a version' do
    version = DeckAPI::VERSION
    expect(version).not_to eq nil
  end

  it 'uses a Client to perform requests' do
    client = DeckAPI::CLIENT
    expect(client).not_to eq nil
  end
end
