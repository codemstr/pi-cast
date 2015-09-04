#!/usr/bin/perl
use strict;
use warnings;

use XML::Simple;
my $xml_file = '/home/pi/nodejs-push-notification-server/notifications.xml';

my $xml = XMLin(
    $xml_file,
    KeepRoot => 0,
    ForceArray => 1,
);

$xml->{message} = `uptime`;
$xml->{notify} = 'on';
$xml->{bgColor} = "black";
$xml->{txtColor} = "orange";
$xml->{user} = "Uptime";
XMLout(
    $xml,
    KeepRoot => 1,
    NoAttr => 1,
    OutputFile => $xml_file,
);
