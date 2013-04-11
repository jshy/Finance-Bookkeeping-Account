requires 'perl', '5.008005';

requires 'MooseX::Role::Parameterized', '1.00';

on test => sub {
    requires 'Test::More', '0.88';
};
