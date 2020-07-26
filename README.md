# nextcloud-deck-api

![](https://api.travis-ci.org/Pamplemousse/nextcloud-deck-api.gem.svg?branch=master)
![](https://inch-ci.org/github/pamplemousse/nextcloud-deck-api.gem.svg?branch=master)

Interact with the [Deck application for Nextcloud](https://apps.nextcloud.com/apps/deck) using Ruby.

Implementation based on [Deck's API documentation](https://deck.readthedocs.io/en/latest/API/).

**Disclaimer: This is very much a work-in-progress that does not cover all the features of the API!**

## How to use

Assuming the following environment variable are set:
  * `DECK_API_USERNAME`: The name of the Nextcloud user to use to access the Deck application;
  * `DECK_API_PASSWORD`: The password associated with the aforementioned user;
  * `DECK_API_DOMAIN`: The domain where the Nextcloud instance is accessible at.

```ruby
require 'nextcloud-deck-api'

# get the list of boards
boards = DeckAPI::API::Boards.get

# get the list of stacks of the board of id 42
stacks = DeckAPI::API::Stacks.get 42

# add a card to the stack of id 43 of the board of id 42
card = Deck::Card(title: 'Title of the card'
                  description: 'A description of what this card is about',
                  board_id: 42,
                  stack_id: 43)
DeckAPI::API::Cards.create card
```

## Development

```
# install the dependencies
bundle install

# build and install the gem locally
bundle exec rake install

# run the tests
bundle exec rake spec

# lint the code
bundle exec rake rubocop

# build and (locally) serve the documentation
bundle exec rake doc
```

## Code of Conduct

Everyone interacting in the `nextcloud-deck-api` project’s codebase, and issue tracker is expected to follow the [code of conduct](https://github.com/Pamplemousse/nextcloud-deck-api/blob/master/CODE_OF_CONDUCT.md).
