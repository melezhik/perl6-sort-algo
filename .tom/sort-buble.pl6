use lib 'lib';

use Utils;

my @a = 1,4,5,6,7,2,1,8,3;
my $swapped;

repeat {

    $swapped = False;

    loop ( my $i = 1; $i < @a.elems; $i++ ) {

      dump-a($i-1,@a);

      if (@a[$i-1] > @a[$i]) {
        swap( $i-1, $i );
        $swapped = True
      }


    }

} until $swapped == False;

sub swap ( $i, $j ) {
  
  say "swap $i and $j";

  my $temp = @a[$i];

  @a[$i] = @a[$j];

  @a[$j] = $temp;

}
