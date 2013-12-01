#include <rb_av_dev.h>

static VALUE initialize(VALUE self, VALUE dev) {
  AVCaptureDeviceInput * input;
  AVCaptureDevice * device;

  Data_Get_Struct(self, AVCaptureDeviceInput, input);
  Data_Get_Struct(dev, AVCaptureDevice, device);

  [input initWithDevice:device error: nil];

  return self;
}

static VALUE allocate(VALUE klass) {
  AVCaptureDeviceInput *input = [AVCaptureDeviceInput alloc];

  return Data_Wrap_Struct(klass, 0, 0, input);
}

VALUE Init_input(VALUE outer) {
  VALUE rb_cDeviceInput = rb_define_class_under(outer, "DeviceInput", rb_cObject);

  rb_define_alloc_func(rb_cDeviceInput, allocate);

  rb_define_method(rb_cDeviceInput, "initialize", initialize, 1);

  return rb_cDeviceInput;
}
