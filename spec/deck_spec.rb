# frozen_string_literal: true

require 'deck'

describe 'Deck' do
  it 'exposes a Board class' do
    expect(Deck::Board).not_to eq nil
  end

  it 'exposes a Card class' do
    expect(Deck::Card).not_to eq nil
  end

  it 'exposes a Stack class' do
    expect(Deck::Stack).not_to eq nil
  end
end
