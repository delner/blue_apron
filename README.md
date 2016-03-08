# Blue Apron: Rock Paper Scissors
###### Requires Ruby 2.3.0

Simulates a game of rock paper scissors.

## Installation

To use as a gem, add this line to your application's Gemfile:

    gem 'blue_apron'

And then install with Bundler:

    $ bundle

Or install it manually with:

    $ gem install blue_apron

## Usage

Run the game from terminal using the `rps.rb` script:

    $ ruby rps.rb <strategy>

Where `<strategy>` can be `favorite` or `last`.

Press `r`, `p`, `s` at prompts to play a rock, paper or scissors move, respectively. Press `x` to quit.

## Testing

Run some tests via

    $ rspec

## Developer's notes

Although the requirements were simple, and this script could have been made much more procedural, I thought it best to showcase some use of object-oriented programming, even if it wasn't entirely necessary.

I wanted to make the game more modular, and possibly extendable. With the `Moves` and `Strategies` module, it'd be pretty easy to implement additional moves and strategies as an extension of this gem, using the `#add` functions. I also thought it was a good idea to separate user input/output from the game flow itself, so that conceivably a better interface could be implemented. This proved to be a good decision, as it made it easier to drive the application from RSpec by swapping out the default terminal interface for one that could be easily used by tests.

Tests and code was added in TDD style, using RSpec. Most were unit tests, but I ended up adding a couple of psuedo integration tests to `game_spec.rb` to add some additional coverage.