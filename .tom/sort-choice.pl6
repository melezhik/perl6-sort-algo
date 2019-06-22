use lib 'lib';

use Utils;

my @a = 1,4,7,3,2,6,7,8,2,1;

dump-a(0,@a);

my $sorted-last-index = 0;

while ( $sorted-last-index < @a.elems ) {

  my $i = find-smallest();

  swap(@a,$sorted-last-index, $i)  unless $i == -1;

  $sorted-last-index++;

  dump-a($sorted-last-index,@a);

}


sub find-smallest () {

  my $smallest = @a[$sorted-last-index];
  my $index = $sorted-last-index;

  loop ( my $i = $sorted-last-index + 1; $i < @a.elems; $i++ ) {

    if @a[$i] < $smallest {
      $smallest = @a[$i];
      $index = $i;
    }

  } 

  return $index == $sorted-last-index ?? -1 !! $index;

}
