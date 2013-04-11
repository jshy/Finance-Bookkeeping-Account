package Finance::Bookkeeping::Account;

use strict;
use 5.008_005;
our $VERSION = '0.01';

use MooseX::Role::Parameterized;

parameter 'nb', isa => 'Str', required => 1;


role {
	my $p = shift;

	has 'balance', is => 'rw', default => 0;

	if ($p->nb eq 'credit') {   # nb is 'normal balance'
		
		method debit => sub { 
			my ($self, $amount) = @_;
			$self->balance($self->balance - $amount); 
		};

		method credit => sub {
			my ($self, $amount) = @_;
			$self->balance($self->balance + $amount); 
		};
	}

	if ($p->nb eq 'debit') {
		method debit => sub { 
			my ($self, $amount) = @_;
			$self->balance($self->balance + $amount); 
		};

		method credit => sub {
			my ($self, $amount) = @_;
			$self->balance($self->balance - $amount); 
		};
	}
};

1;
__END__

=encoding utf-8

=head1 NAME

Finance::Bookkeeping::Account - Blah blah blah

=head1 SYNOPSIS

  use Finance::Bookkeeping::Account;

=head1 DESCRIPTION

Finance::Bookkeeping::Account is

=head1 AUTHOR

Jesse Shy E<lt>jshy@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2013- Jesse Shy

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
