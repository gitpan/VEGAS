#!/usr/bin/perl -w

# VEGAS: Virtual Extensive GAme-card Simulation

use strict;
package VEGAS;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(&create &shuffle &cut &deal &humanize $VERSION);
our $VERSION = "1.0";

sub create
{
	my ($include_jokers, $amount_of_decks) = @_;
	my @suits = qw(s h d c);
	my $suit;

	my @deck = ();

	for (my $i = 0; $i < $amount_of_decks; $i++)
	{
		foreach $suit (@suits)
		{
			for (my $j = 1; $j <= 13; $j++)
			{
				push(@deck, $j . $suit);
			}
		}
		if ($include_jokers == 1)
		{
			push(@deck, 'jb');
			push(@deck, 'jr');
		}
	}
	
	return @deck;
}


sub shuffle
{
	my $amount = $_[0];
	my @deck = @_[1 .. scalar(@_) - 1];
	my $j;
	my $tmp;

	for (my $i = 0; $i < scalar(@deck); $i++)
	{
		$j = int(rand($i));
		$tmp = $deck[$i];
		$deck[$i] = $deck[$j];
		$deck[$j] = $tmp;
	}

	return @deck;
}


sub cut
{
	my @deck = @_;
	my $place = int(rand(scalar(@deck)));
	my @deck1 = @deck[0 .. $place];
	my @deck2 = @deck[$place + 1 .. scalar(@deck) - 1];
	my @new_deck = ();

	foreach (@deck2)
	{
		push(@new_deck, $_);
	}
	
	foreach (@deck1)
	{
		push(@new_deck, $_);
	}

	return @new_deck;
}


sub deal
{
	my $cards_per_hand = $_[0];
	my $number_of_hands = $_[1];
	my @deck = @_[2 .. scalar(@_) - 1];

	my @to_deal;

	for (my $i = 0; $i < $number_of_hands; $i++)
	{
		for (my $j = 0; $j < $cards_per_hand; $j++)
		{
			push(@to_deal, $deck[$i + $j * $number_of_hands]);
		}
	}

	splice(@deck, 0, $cards_per_hand * $number_of_hands);

	return (@to_deal, @deck);
}


sub humanize
{
	my ($card) = @_;
	my $number;
	my $suit;

	if ($card =~ /^(\d+|j)(s|h|d|c|b|r)$/)
	{
		$number = $1;
		$suit = $2;
	}

	my %number_to_name = 
		(
		 1 => "Ace",
		 11 => "Jack",
		 12 => "Queen",
		 13 => "King",
		 "j" => "Jack"
		 );

	my %letter_to_suit =
		(
		 "s" => "Spades",
		 "h" => "Hearts",
		 "d" => "Diamonds",
		 "c" => "Clubs",
		 "b" => "Blacks",
		 "r" => "Reds"
		 );
	
	if ($number eq "j")
	{
		$number = $number_to_name{$number};
	}
	elsif (($number == 1) || ($number >= 11))
	{
		$number = $number_to_name{$number};
	}

	return $number . " of " . $letter_to_suit{$suit};
}
