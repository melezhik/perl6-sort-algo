#!perl6

my @a = (1,2,4,6,1,3,5,3,8,3);

my $i = 0;

say "\n";

dump-a(0);

while ( $i < @a.elems - 1  ) {

  my $neigh = $i+1;

  if @a[$neigh] < @a[$i] {
    say "\@a[$neigh]={@a[$i+1]} < \@a[$i]={@a[$i]} ... run find-less-then";
    if my $j = find-less-then(@a, @a[$neigh]) {
      say "insert \@a[$neigh]={@a[$neigh]} => \@a[$j]={@a[$j]}\n";
      insert-element(@a, $j, $neigh);
    }

  }

  $i++;

  dump-a($i);

}

sub insert-element ( @a, int $at-index, int $from-index ) {

  my $temp = @a[$at-index];

  @a[$at-index] = @a[$from-index];

  loop ( my $i = $from-index; $i > $at-index; $i-- ) {
    @a[$i] = @a[$i-1];
  }

  @a[$at-index + 1] = $temp;

}

sub find-less-then ( @a, int $what ) {

  loop ( my $i = 0; $i < @a.elems; $i++ ) {
    say "{@a[$i]} <> $what";
    if @a[$i] > $what {
      say "{@a[$i]} < $what. return $i";
      return $i 
    }
  }

  return

}

sub dump-a ($current) {

  print "N:";
  for 0 .. @a.elems -1 -> $i {
    print $i == $current ?? "|*$i|" !! "|$i|";
  }

  print "\n";

  for 0 .. @a.elems -> $i {
    print "---";
  }

  print "\n";

  print "V:";
  for @a -> $i {
    print "|$i|"
  }

  print "\n";

  for 0 .. @a.elems -> $i {
    print "---";
  }

  print "\n\n";

}
