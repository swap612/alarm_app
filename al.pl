use strict;
use warnings;

$\="\n";

sub play_alarm{
	#print shift @_;
	my $time = shift @_;
	print "$time";
	sleep($time);	
	
	#	exec "firefox 'https://www.youtube.com/watch?v=rFU28HBP7B0&list=RDrFU28HBP7B0&start_radio=1'";

}


# start 
my $file='links.txt';
my $lcount = `wc -l < $file`;
die "wc failed: $?" if $?;
chomp($lcount);
print "Line count: $lcount";

# generating random number and selecting the random link from file
my $id = int(rand($lcount)+1);
print $id;
my $link=`sed -n ${id}p $file`;
chomp $link;
print $link;

# playing the alarm
play_alarm $time $link
=begin

open FH, '<', $file or die $!;
while( $link =<FH>){
	chomp $link;
	print $link;
}
=cut

