#!/usr/bin/perl
use strict;
use XML::Simple;
use Data::Dumper;

my $booklist = XMLin('test.xml');
# print Dumper($booklist);

foreach my $book (@{$booklist->{book}}) {
	if ($book->{type} eq 'technical') {
		print $book->{title} . "\n";
	}
}
