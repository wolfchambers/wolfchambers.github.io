#! /usr/bin/perl
use Class::Struct;
use Math::BigInt;

my $usage = "Usage: $0 tcpdump_file\n";

my $fh;

struct( conn =>
{ fin => int, stime => double, etime => double});

my %hash = ();

# Main program
if ($#ARGV != 0) 
{
    die "$usage";
}
else
{
    my $file = $ARGV[0];
    my $start = 0;
    open(TD, "sudo tcpdump -r $file -tt |") || die "tcpdump failed\n";
    while (<TD>) {
        # This is packet from client to server, remember time, port and flag
	if (/([0-9]+.[0-9]+)(.*)(1.1.2.3.*)(\.[0-9]+)(.*5.6.7.8.*)(S)/)
	{
	    my $time = $1;
	    if ($start == 0)
	    {
		$start = $time;
	    }
	    my $port = $4;
	    if ($hash{$port} == 0)
	    {
		$hash{$port} = new conn();
		$hash{$port}->{fin} = 0;
		$hash{$port}->{stime} = $1;
		$hash{$port}->{etime} = 0;
		my $fin = $hash{$port}->{fin};
	    }
	}
	elsif (/([0-9]+.[0-9]+)(.*)(1.1.2.3)(\.[0-9]+)(.*)(5.6.7.8)(.*)([F|.|R])/)
	{	    
	    my $time = $1;
	    my $port = $4;
	    my $flag = $8;
	    my $h = $hash{$port};
	    if ($hash{$port} != 0 && ($flag eq 'F'))
	    {
		$hash{$port}->{fin} = 1;
	    }
	    elsif (($flag eq "." && $hash{$port}->{fin} == 1) ||
	      $flag eq "R")
	    {
		$hash{$port}->{etime} = $1;
	    }
	}
	elsif (/([0-9]+.[0-9]+)(.*)(1.1.2.3)(\.[0-9]+)(.*)(5.6.7.8.*)(.*)(R)/)
        {
	    my $time = $1;
	    my $port = $4;
	    my $flag = $7;
	    $hash{$port}->{etime} = $1;
	}
    }
    for my $key ( keys %hash ) {
	my $stime = $hash{$key}->{stime};
	my $etime = $hash{$key}->{etime};
	if ($etime == 0)
	{
	    $etime = $stime + 200.0;
	}
	my $begin = $stime - $start;
	my $dur = $etime - $stime;
	print "$begin $dur\n";
    }
}

