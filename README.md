# NAME

Finance::Bookkeeping::Account - debit/credit account balances correctly

# SYNOPSIS

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

	my $cr = MyCreditAccount->new;
	$cr->credit(50);
	$cr->debit(20);
	say $cr->balance; # 30



	my $dr = MyDebitAccount->new;
	$dr->debit(10);
	$dr->credit(5);
	$dr->credit(50);
	say $dr->balance; # -45

	my $bankaccount = MyCheckbook->new;
	$bankaccount->deposit(10);
	$bankaccount->withdraw(5);
	say $bankaccount->balance; # 5
	



# DESCRIPTION

Finance::Bookkeeping::Account is a parameterized role to create accounts that debit and credit correctly depending on account type. Input can only be positive numbers or you will get an error message stating the input either does not look like a number or is not a positive number.

## API

- debit

    nb = debit, this increases the balance. nb = credit, this decreases the balance.

- credit

    nb = credit, this increases the balance. nb = debit, this decreases the balance.

# AUTHOR

Jesse Shy <jshy@cpan.org>

# COPYRIGHT

Copyright 2013- Jesse Shy

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
