package Finance::Bookkeeping::Account;

use strict;
use 5.008_005;
our $VERSION = '0.01';

use MooseX::Role::Parameterized;

parameter 'nb', isa => 'Str', required => 1;

role {
	my $p = shift;

	has 'balance', is => 'ro', writer => '_set_balance', default => 0;


	method 'credit' => sub {
		my ($self, $amount) = @_;
		return $p->nb eq 'credit' ? $self->_set_balance($self->balance + $amount) : $self->_set_balance($self->balance - $amount); 
	};

	method 'debit' => sub {
		my ($self, $amount) = @_;
		return $p->nb eq 'debit' ? $self->_set_balance($self->balance + $amount) : $self->_set_balance($self->balance - $amount); 
	};
};

1;

__END__

=encoding utf-8

=head1 NAME

Finance::Bookkeeping::Account - debit/credit account balances correctly

=head1 SYNOPSIS

	package MyCreditAccount;
	use Moose;
	with 'Finance::Bookkeeping::Account' => { nb => 'credit'}; # consuming class declars it's normal balance (nb) is credit or debit

	package MyDebitAccount;
	use Moose;
	with 'Finance::Bookkeeping::Account' => { nb => 'debit'}; # consuming class declars it's normal balance (nb) is credit or debit

	package MyCheckbook;
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

	my $cr = CreditAccount->new;
	$cr->credit(50);
	$cr->debit(20);
	say $cr->balance; # 30


	my $dr = DebitAccount->new;
	$dr->debit(10);
	$dr->credit(5);
	$dr->credit(50);
	say $dr->balance; # -45

	my $bankaccount = MyCheckbook->new;
	$bankaccount->deposit(10);
	$bankaccount->withdraw(5);
	say $bankaccount->balance; # 5
	

=head1 DESCRIPTION

Finance::Bookkeeping::Account is a parameterized role to create accounts that debit and credit correctly depending on account type.

=head2 API

=over

=item debit

nb = debit, this increases the balance. nb = credit, this decreases the balance.

=item credit

nb = credit, this increases the balance. nb = debit, this decreases the balance.

=back

=head1 AUTHOR

Jesse Shy E<lt>jshy@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2013- Jesse Shy

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
