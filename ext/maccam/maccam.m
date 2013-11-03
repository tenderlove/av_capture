#import <Cocoa/Cocoa.h>
#import <ImageCaptureCore/ImageCaptureCore.h>
#include <ruby.h>

void Init_maccam() {
  VALUE rb_cMacCam = rb_define_class("MacCam", rb_cObject);
}
