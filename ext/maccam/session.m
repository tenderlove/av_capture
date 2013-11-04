#include <rb_av_dev.h>

static VALUE can_add_output_p(VALUE self, VALUE output) {
  AVCaptureSession * session;
  AVCaptureOutput * op;

  Data_Get_Struct(self, AVCaptureSession, session);
  Data_Get_Struct(output, AVCaptureOutput, op);

  if ([session canAddOutput:op]) {
    return Qtrue;
  } else {
    return Qfalse;
  }
}

static VALUE add_output(VALUE self, VALUE output) {
  AVCaptureSession * session;
  AVCaptureOutput * op;

  Data_Get_Struct(self, AVCaptureSession, session);
  Data_Get_Struct(output, AVCaptureOutput, op);

  [session addOutput:op];

  return self;
}

static VALUE allocate(VALUE klass) {
  AVCaptureSession *session = [[AVCaptureSession alloc] init];

  return Data_Wrap_Struct(klass, 0, 0, session);
}

VALUE Init_session(VALUE outer) {
  VALUE rb_cSession = rb_define_class_under(outer, "Session", rb_cObject);

  rb_define_alloc_func(rb_cSession, allocate);
  rb_define_method(rb_cSession, "can_add_output?", can_add_output_p, 1);
  rb_define_method(rb_cSession, "add_output", add_output, 1);

  return rb_cSession;
}
