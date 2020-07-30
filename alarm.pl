use strict;
use warnings;

$\="\n";
# Edit your browser cmd
my $browser ='google-chrome';

# alarm sub-routine
sub play_alarm{
	#print shift @_;
	my $time = shift @_;
	my $link= shift @_;
	
	#wait for the given time 	
	sleep($time);

	# WakeUp Code	
	exec "$browser $link"

}


# start 
my $file='links.txt';
my $lcount = `wc -l < $file`;
die "wc failed: $?" if $?;
chomp($lcount);
#print "Line count: $lcount";

# generating random number and selecting the random link from file
my $id = int(rand($lcount)+1);
#print $id;
my $link=`sed -n ${id}p $file`;
chomp $link;
#print $link;

#get the time of alarm 
my $time = 5;

# playing the alarm
play_alarm($time, $link);
