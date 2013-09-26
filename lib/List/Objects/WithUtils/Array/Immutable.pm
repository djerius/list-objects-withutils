package List::Objects::WithUtils::Array::Immutable;
use strictures 1;

require Role::Tiny;
Role::Tiny->apply_roles_to_package( __PACKAGE__,
  qw/
    List::Objects::WithUtils::Role::Array
    List::Objects::WithUtils::Role::WithJunctions
  /
);
Role::Tiny->apply_roles_to_package( __PACKAGE__,
  qw/
    List::Objects::WithUtils::Role::Array::Immutable
  /,
);

use Exporter 'import';
our @EXPORT = 'immarray';
sub immarray { __PACKAGE__->new(@_) }

1;

=pod

=begin Pod::Coverage

new
immarray
clear
set
pop
push
shift 
unshift 
delete
delete_when
insert 
splice

=end Pod::Coverage

=head1 NAME

List::Objects::WithUtils::Array::Immutable - Immutable array objects

=head1 SYNOPSIS

  use List::Objects::WithUtils 'immarray';

  my $array = immarray(qw/ a b c /);

  my ($head, $rest) = $array->head;

=head1 DESCRIPTION

A subclass of L<List::Objects::WithUtils::Array> without the following
list-mutating methods:

  clear
  set
  pop push
  shift unshift
  delete delete_when
  insert
  splice

The array is marked read-only; attempting to call the methods listed above or
manually modify the backing ARRAY reference will throw an exception.

=head1 AUTHOR

Jon Portnoy <avenj@cobaltirc.org>

Licensed under the same terms as Perl.

=cut
