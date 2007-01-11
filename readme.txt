VEGAS: Virtual Extensive GAme-card Simulation

VEGAS is a simple library, meant to assist developers in writing card
games. It does not provide any interface-specific, or even
game-specific functions. It does, however, ease the manipulation of
the one thing that all card games have in common - the cards.


==FUNCTION DOCUMENTATION==

All of VEGAS is located in one Perl module, VEGAS.pm. After it is
installed (or if it is in the same directory as your program), type in

use VEGAS;

somewhere near the top, after the shebang. This will include all of
the functions that ship with VEGAS.

All of VEGAS' functions are independent of each other, and are
stand-alone. That is, each one expects certain arguments (or does not
expect any, depending on the function), and returns something. There
are no classes tying them all together. It is up to the developer to
decide how he wants to use the functions. For example, he may want to
create() a deck, and then shuffle it. This can be accomplished with

shuffle(3, create(1, 1));

Because of this lack of connection, it is very important for the
functions to be consistent. Because of this, the following are always
true with functions:

-For as much as possible, all names of functions will be a single verb
 describing what the function does.
-All functions will accept some amount of arguments. All arguments
 will be required.

Below is a comprehensive list of the functions with detailed
descriptions:


create($include_jokers, $amount_of_decks)
  This function takes two arguments. The first decides whether or not
  there will be jokers included in the deck. If the scalar is 1, it will
  include them, otherwise, it will not. The function returns an array,
  with each element in the form NumberSuit, where Number is a number
  from 1 (ace) to 13 (king) and Suit is either s (spades), h (hearts),
  d (diamonds) or c (clubs). The exception to this is jb and jr, which
  are the black and red jokers, respectively.

shuffle($amount, @deck)
  This function takes two arguments. The first is a scalar and the
  second is an array of cards, such as the one produced by
  create(). The function performs a shuffle on the cards the amount of
  times specified in the first argument. The function returns the
  shuffled array.

cut(@deck)
  This function takes just one argument, a card array, such as the one
  produced by create(). It picks a random element of the array, and
  makes it become the start of the array, followed by all of the
  elements, which were under it. Those that were above it are tacked
  onto the end. The function returns the new array.

deal($cards_per_hand, $number_of_hands, @deck)
  This function takes three arguments. The first specifies how many
  cards will be in each hand dealt. The second specifies how many
  hands there will be. The third is a card array, such as the one
  created by create(), from which the cards are being dealt. The
  function returns a new array, with the first $cards_per_hand cards
  the cards for the first hand, the second $cards_per_hand cards for
  the second hand, etc. Note that the function does not just take the
  first $cards_per_hand cards from @deck and make them the first deck,
  it deals like a dealer does and gives the first $number_of_hands
  cards to each hand, then the next $number_of_hands cards to each
  hand, etc.

humanize($card)
  This function takes just one argument, a card array element, such as
  the one that is produced by create(). This function expands it to a
  much more human-friendly text. For example, ``12h'' becomes ``Queen of
  Hearts'', ``7d'' becomes ``7 of Diamonds'' and ``jr'' becomes ``Jack
  of Reds'' (quotation marks for clarity only). The expanded form is returned.