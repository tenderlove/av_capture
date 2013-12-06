#include <rb_av_dev.h>

static VALUE rb_name(VALUE self) {
  AVCaptureDevice * dev;

  Data_Get_Struct(self, AVCaptureDevice, dev);

  return rb_enc_associate(rb_str_new2([[dev localizedName] UTF8String]),
      rb_utf8_encoding());
}

static VALUE has_media_type_p(VALUE self, VALUE media_type) {
  AVCaptureDevice * dev;

  Data_Get_Struct(self, AVCaptureDevice, dev);

  NSString * mt = [NSString stringWithCString: StringValuePtr(media_type)
                            encoding: NSUTF8StringEncoding];

  if ([dev hasMediaType: mt]) {
    return Qtrue;
  } else {
    return Qfalse;
  }
}

VALUE Init_device(VALUE outer) {
  VALUE rb_cAVDevice = rb_define_class_under(outer, "Device", rb_cObject);
  rb_define_method(rb_cAVDevice, "name", rb_name, 0);
  rb_define_method(rb_cAVDevice, "has_media_type?", has_media_type_p, 1);

  return rb_cAVDevice;
}
