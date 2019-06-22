unit module Utils;

sub dump-a ($current,@a) is export {

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


sub swap ( @a, $i, $j ) is export {
  
  say "swap $i and $j";

  my $temp = @a[$i];

  @a[$i] = @a[$j];

  @a[$j] = $temp;

}

