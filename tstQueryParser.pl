use strict;
use warnings;
use locale;
use Data::Dumper;
use Search::QueryParser;


my $qp = new Search::QueryParser;

$| = 1;

while (<STDIN>) {
  chomp;
  my $implicitPlus = ($_ =~ s/^\+\+//);
  my $q = $qp->parse($_, $implicitPlus) or print($qp->err), next;
  print $qp->unparse($q), "\n", Dumper($q);
}

