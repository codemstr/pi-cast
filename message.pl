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
my $msg;
my $bgColor = "black";
my $txtColor = "white";
my $user = "Administrator";
my $c = 1;
my $duration = 10000; #Secs
my @myArgs = @ARGV;
my $total = $#ARGV + 1;

foreach my $arg (@myArgs) {
   if ($arg eq "-d") {
       $duration = $myArgs[$c];
   }	
   if ($arg eq "-u") {
	$user = $myArgs[$c];
   } 
   if ($arg eq "-bg") {
	$bgColor = $myArgs[$c];
   } 
   if ($arg eq "-t") {
	$txtColor = $myArgs[$c];
   }
   if ($c <  int(@myArgs)) {
  	if ($myArgs[$c - 1] =~ m{\-(.*)}) {
		$c++;
		next;
   	} else {
		if ($myArgs[$c] !~ m{\-(.*?)}) {
			$msg .= " ".$myArgs[$c];
		}
		$c++;
	}
   
   } 
}

if (!$msg) {
	$msg = "Updating webapp via command line.";
}

$xml->{message} = $msg;
$xml->{notify} = "on";
$xml->{duration} = $duration; 
$xml->{user} = $user;
$xml->{bgColor} = $bgColor;
$xml->{txtColor} = $txtColor;

XMLout(
    $xml,
    KeepRoot => 1,
    NoAttr => 1,
    OutputFile => $xml_file,
);

