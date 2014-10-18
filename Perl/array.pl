#!/usr/bin/perl

my @ary=undef;
my $cnt=0;
my $lpcnt=5;
my @a=qw(a b c d);

while ($lpcnt>0) {
    #print "@a\n";
    my @ax=undef;
    for (my $i=0; $i<=$#a; $i++) {
        $ax[$i]=$a[$i];
        #print "$a[$i] ";
        #print "$ary[$cnt][$i] ";
    }
    my $str=join("|",@ax);
    #print "@ax\n";
    #print "$str\n";
    $ary[$cnt]=$str;
    my @ay=split(/\|/,$ary[$cnt]);
    #print "@ay\n\n";
    $lpcnt--;
    $cnt++;
}

print "ary max index = $#ary\n";
for (my $i=0; $i<=$#ary; $i++) {
    print "$ary[$i]\n";
    my @az=split(/\|/,$ary[$i]);
    print "az max index = $#az\n";
    for (my $j=0; $j<=$#az; $j++) {
        print "ary[$i][$j]=$az[$j]\n";
    }
}

