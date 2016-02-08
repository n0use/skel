#!/usr/bin/perl
#
# John Newman - jnn@synfin.org - 02/08/2016
# simple script to take output (from wherever) and print duplicate lines only once
# duplicate lines do not have to be adjacent to one another as with "sort -u" 

my %lines = ();
my %count = ();
my $n = 0;
my $show_count = 0;

if ($ARGV[0] =~ /^-c/) {
    $show_count = 1;
}

while (my $_ = <STDIN>) {
    chomp;
    if (!length($lines{ $_ })) {
        $lines{ $_ } = ++$n ;
        $count{ $_ } = 1;
    } else {
        $count{ $_ }++; 
    }
}

foreach my $l (sort { $lines{$a} <=> $lines{$b} } keys %lines) {
    print $l ;
    print " (count=" . $count{ $l } . ")"             if ($show_count == 1);
    print "\n";
}
