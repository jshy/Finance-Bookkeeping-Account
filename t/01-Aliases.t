package AssetAccount;
use Moose;
with ('Finance::Bookkeeping::Account' => { 
	nb => 'debit',
	-alias => {
		debit => 'deposit',
		credit => 'withdraw'
		},
	-excludes => ['debit', 'credit'],
	}
);

package main;

use strict;
use warnings;
use lib './lib';

use Test::More;                      # last test to print

my $dr = AssetAccount->new;
$dr->deposit(10);
$dr->withdraw(5);

print $dr->balance . "\n";

$dr->withdraw(50);
print $dr->balance . "\n";



done_testing();
