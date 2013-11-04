#include <ruby.h>
#include <cam_browser.h>
#import <AVFoundation/AVFoundation.h>

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

static VALUE rb_name(VALUE self) {
  AVCaptureDevice * dev;

  Data_Get_Struct(self, AVCaptureDevice, dev);

  return rb_str_new2([[dev localizedName] UTF8String]);
}

void Init_maccam() {
  VALUE rb_cMacCam = rb_define_class("MacCam", rb_cObject);
  rb_cAVDevice = rb_define_class_under(rb_cMacCam, "Device", rb_cObject);

  rb_define_singleton_method(rb_cMacCam, "devices", rb_devices, 0);
  rb_define_method(rb_cAVDevice, "name", rb_name, 0);
}
