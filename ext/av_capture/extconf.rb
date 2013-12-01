require 'mkmf'

$DLDFLAGS << ' -framework Foundation -framework AVFoundation -framework ImageCaptureCore'

create_makefile 'av_capture'
