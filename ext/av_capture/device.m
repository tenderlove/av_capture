#include <rb_av_dev.h>

static VALUE rb_name(VALUE self) {
  AVCaptureDevice * dev;

  Data_Get_Struct(self, AVCaptureDevice, dev);

  return rb_str_new2([[dev localizedName] UTF8String]);
}

VALUE Init_device(VALUE outer) {
  VALUE rb_cAVDevice = rb_define_class_under(outer, "Device", rb_cObject);
  rb_define_method(rb_cAVDevice, "name", rb_name, 0);

  return rb_cAVDevice;
}
