#include <rb_av_dev.h>

VALUE rb_cStillImageOutput;
VALUE rb_cAVDevice;

static VALUE rb_devices(VALUE klass) {
  VALUE devs;
  NSArray * list = [AVCaptureDevice devices];

  devs = rb_ary_new2([list count]);

  for (id object in list) {
    VALUE dev = Data_Wrap_Struct(rb_cAVDevice, 0, 0, object);
    rb_ary_push(devs, dev);
  }

  return devs;
}

void Init_maccam() {
  VALUE rb_cAVCapture = rb_define_class("AVCapture", rb_cObject);

  rb_cAVDevice = Init_device(rb_cAVCapture);

  rb_cStillImageOutput = Init_still_image_output(rb_cAVCapture,
      Init_connection(rb_cAVCapture));

  Init_session(rb_cAVCapture);

  rb_define_singleton_method(rb_cAVCapture, "devices", rb_devices, 0);
  rb_define_const(rb_cAVCapture, "AVMediaTypeVideo", rb_str_new2([AVMediaTypeVideo UTF8String]));
}
