# frozen_string_literal: true

describe "require 'nextcloud-deck-api'" do
  it 'fails to load the gem if the necessary environment variables are missing' do
    missing_variables = 'DECK_API_DOMAIN, DECK_API_USERNAME, DECK_API_PASSWORD'
    exception = "nextcloud-deck-api is expecting the following environment variables: #{missing_variables}"

    expect { require 'nextcloud-deck-api' }.to raise_exception exception
  end

  it 'loads the gem without complains if the proper environment variables are set' do
    ['DECK_API_DOMAIN', 'DECK_API_USERNAME', 'DECK_API_PASSWORD'].map do |variable|
      ENV[variable] = 'value'
    end

    expect { require 'nextcloud-deck-api' }.not_to raise_exception
  end
end

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
