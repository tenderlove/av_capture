#include <rb_av_dev.h>

static VALUE rb_connect(VALUE self, VALUE media_type) {
  AVCaptureDevice * dev;

  Data_Get_Struct(self, AVCaptureDevice, dev);

  /*
  AVCaptureConnection * conn = [dev connectionWithMediaType:mt];
  */
  return Qnil;
}

VALUE Init_still_image_output(VALUE outer) {
  VALUE rb_cStillImageOutput = rb_define_class_under(outer, "StillImageOutput", rb_cObject);

  rb_define_method(rb_cStillImageOutput, "connect", rb_connect, 1);

  return rb_cStillImageOutput;
}
