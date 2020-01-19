#!/bin/env perl
# dna_stats.pl by Sam Johnson
#
# For a given DNA string, this program returns the 
# composition (in percentages) of each nucleotide, 
# followed by the GC content (also as a percentage
# of the total).
use strict; use warnings;

# Usage Statement
die "Usage Statement: dna_stats.pl <dna sequence>\n"
	unless @ARGV == 1;
my ($seq) = @ARGV;

# Error handling
die "Non-DNA character in seq!\n" if (
	$seq =~ m/[efijlopqxz]/i
);
die "Upper case only! use tr/[a-z]/[A-Z]/\n" if (
	$seq =~ m/[a-z]/
);

# Testing output
print "Sequence Entered:\n" . "$seq\n";

# Count sequence length (in bp)
my $seq_count = ($seq =~ tr/[A-Z]/[A-Z]/);
print "Sequence Length: " . "$seq_count" . "bp\n";

# Count individual nucleotides
my $a = ($seq =~ tr/(A/A/);
my $t = ($seq =~ tr/T/T/);
my $c = ($seq =~ tr/C/C/);
my $g = ($seq =~ tr/G/G/);

# Composition percentage calculation
my $a_perc = ($a / $seq_count) * 100;
print "(A)denine:  " . "$a_perc" . "%\n";

my $t_perc = ($t / $seq_count) * 100;
print "(T)hymine:  " . "$t_perc" . "%\n";

my $c_perc = ($c / $seq_count) * 100;
print "(C)ytosine: " . "$c_perc" . "%\n";

my $g_perc = ($g / $seq_count) * 100;
print "(G)uanine:  " . "$g_perc" . "%\n";

# Calculate & print GC content (as percentage of
# total)
my $gc_perc = (($c + $g) / $seq_count) * 100;
print "\nGC Content: " . "$gc_perc" . "%\n";

