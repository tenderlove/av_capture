#include <ruby.h>
#include <cam_browser.h>

CamBrowser * browser;

static void deallocate(CamBrowser *b) {
  [b release];
}

static VALUE allocate(VALUE klass) {
  return Data_Wrap_Struct(klass, 0, deallocate, browser);
}

void Init_maccam() {
  browser = [[CamBrowser alloc] init];

  VALUE rb_cMacCam = rb_define_class("MacCam", rb_cObject);
  rb_define_alloc_func(rb_cMacCam, allocate);
}
