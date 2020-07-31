#!/usr/local/bin/perl

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
	
	print "Alarm set after $time seconds";
	#wait for the given time 	
	sleep($time);

	# WakeUp Code	
	exec "$browser $link"

}


# start 
print "Your alarm System.\nEnter your choice \n1. Countdown Timer \n2. Alarm Clock";
my $ch = int(<STDIN>);
print $ch;

#get the time for alarm 
my $time = 5;

if($ch == 1){
	print "Enter the Countdown timer in HH:MM:SS";
	my $input =<STDIN>;
	chomp $input;
	#print $input;
	my @tc = split ':', $input;
	#print @tc;
	my $hh = shift @tc;
	my $mm = shift @tc;
	my $ss = shift @tc;
	#print "HH:$hh MM:$mm SS:$ss";
 	#convert the timer into seconds
	my $tsecs = ($hh*60+$mm)*60+$ss	;
	#print "Secs:$tsecs";
	$time=int($tsecs);
}
elsif($ch == 2){

	#get the time of alarm 
	print "Enter the time for alarm in HH:MM:SS format";
	my $input =<STDIN>;
	chomp $input;
	#print $input;
	
	#convert it into seconds
	my @tc = split ':', $input;
	#print @tc;
        my $hh = shift @tc;
        my $mm = shift @tc;
        my $ss = shift @tc;
	#print "HH:$hh MM:$mm SS:$ss";
        #convert the timer into seconds
        my $tsecs = ($hh*60+$mm)*60+$ss ;
	#print "Secs:$tsecs";
        $time=$tsecs;

	#get current time
	my $sec;
	my $min;
	my $hour;
	($sec,$min,$hour) = localtime();
	#print "$hour:$min:$sec";	
	#convert the timer into seconds
        my $curr_secs = ($hour*60+$min)*60+$sec ;
	#print "Secs:$curr_secs";
	#Calc Time Difference
	my $tdiff = $tsecs - $curr_secs;
	if($tdiff<0){
		print "Please enter time after current time";
		exit 1;
	}
	else{
		#print "Secs:$tdiff";
		$time=int($tdiff);
	}
}

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

# playing the alarm
play_alarm($time, $link);
