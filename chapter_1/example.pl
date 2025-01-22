#!/usr/bin/perl -w

# this is a comment
$message = "hello, world!\n";
print $message;

# let's make something with an array
@kids = ( "Levi", "Evelyn", "Norah" );
foreach $kid (@kids) {
	print "this kid is $kid\n";
}

# and something with a hash
%heights = (
	"Levi" => 4.5,
	"Evelyn" => 3.75,
	"Norah" => 2.3,
);
foreach $kid (sort keys %heights) {
	print "$kid\'s height is $heights{$kid} feet\n" 
}
