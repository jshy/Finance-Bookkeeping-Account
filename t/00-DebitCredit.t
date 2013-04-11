package CreditAccount;
use Moose;
with ('Finance::Bookkeeping::Account' => { nb => 'credit'});

package DebitAccount;
use Moose;
with ('Finance::Bookkeeping::Account' => { nb => 'debit'});

package main;

use strict;
use warnings;
use lib './lib';

use Test::More;                      # last test to print


my $cr = CreditAccount->new;
$cr->credit(50);
print $cr->balance . "\n";
$cr->debit(21.4);
print $cr->balance . "\n";


my $dr = DebitAccount->new;
$dr->debit(10);
$dr->credit(5);

print $dr->balance . "\n";

$dr->credit(50);
print $dr->balance . "\n";



done_testing();
