# q.pm

# simple subs for use with the ? alias

use List::Util('sum');
use List::MoreUtils;
use Import::Into;

use parent qw(Exporter);
sub import {
   shift->export_to_level(1);
   @List::MoreUtils::EXPORT = @List::MoreUtils::EXPORT_OK;
   @List::Util::EXPORT = @List::Utils::EXPORT_OK;
   List::MoreUtils->import::into(1);
   List::Util->import::into(1);
}

use constant PI    => 4 * atan2(1, 1);

our @EXPORT = qw/mean PI/;

sub mean { 
   return ((sum @_) / ( @_));
}

1;
