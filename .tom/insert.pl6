#!perl6

my @a = (1,2,4,6,1,3,5,3,7,8,3);
my $i = 0;

say @a.perl;

while ( $i < @a.elems - 1  ) {

  if @a[$i+1] < @a[$i] {
    say "@a[$i+1] < @a[$i]";
    if my $j = find-less-then(@a, @a[$i+1]) {
      say "insert $j => $i";
      insert-element(@a, $i, $j);
    }

  }
  say @a.perl;
  $i++;
}

sub insert-element ( @a, int $at-index, int $from-index ) {

  my $temp = @a[$at-index];

  @a[$at-index] = @a[$from-index];

  #say $temp;

  loop ( my $i = $from-index; $i > $at-index; $i-- ) {
    @a[$i] = @a[$i-1];
  }

  @a[$at-index + 1] = $temp;


}

sub find-less-then ( @a, int $what ) {

  loop ( my $i = 0; $i < @a.elems; $i++ ) {
    say "{@a[$i]} <> $what";
    if @a[$i] < $what {
      say "{@a[$i]} < $what. return $i";
      return $i 
    }
  }  

  return

}
