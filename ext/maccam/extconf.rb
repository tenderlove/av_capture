require 'mkmf'

$DLDFLAGS << ' -framework Foundation'

create_makefile 'maccam'
