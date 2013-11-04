#include <ruby.h>
#import <AVFoundation/AVFoundation.h>

VALUE rb_cAVDevice;
VALUE rb_cStillImageOutput;

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

static VALUE rb_name(VALUE self) {
  AVCaptureDevice * dev;

  Data_Get_Struct(self, AVCaptureDevice, dev);

  return rb_str_new2([[dev localizedName] UTF8String]);
}

static VALUE rb_connect(VALUE self, VALUE media_type) {
  AVCaptureDevice * dev;

  Data_Get_Struct(self, AVCaptureDevice, dev);

  /*
  AVCaptureConnection * conn = [dev connectionWithMediaType:mt];
  */
  return Qnil;
}

void Init_maccam() {
  VALUE rb_cMacCam = rb_define_class("MacCam", rb_cObject);
  rb_cAVDevice = rb_define_class_under(rb_cMacCam, "Device", rb_cObject);
  rb_cStillImageOutput = rb_define_class_under(rb_cMacCam, "StillImageOutput", rb_cObject);

  rb_define_singleton_method(rb_cMacCam, "devices", rb_devices, 0);
  rb_define_method(rb_cAVDevice, "name", rb_name, 0);
  rb_define_method(rb_cStillImageOutput, "connect", rb_connect, 1);

  rb_define_const(rb_cAVDevice, "AVMediaTypeVideo", rb_str_new2([AVMediaTypeVideo UTF8String]));
}
