#!/usr/bin/perl
use strict;
use warnings;

use XML::Simple;
my $url = 'http://paste.wtf.im/images/';
my $dir = '/mnt/gig/images/';
my @files = glob($dir ."*.jpg");

my $random_file = $files[rand @files];
my $xml_file = '/home/pi/nodejs-push-notification-server/notifications.xml';
$random_file =~ s/$dir//;
#print $url . $random_file, "\n";

my $xml = XMLin(
    $xml_file,
    KeepRoot => 0,
    ForceArray => 1,
);

$xml->{notify} = 'off';
$xml->{image} = $url . $random_file;

XMLout(
    $xml,
    KeepRoot => 1,
    NoAttr => 1,
    OutputFile => $xml_file,
);
