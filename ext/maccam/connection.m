#include <rb_av_dev.h>

VALUE Init_connection(VALUE outer) {
  VALUE rb_cConnection = rb_define_class_under(outer, "Connection", rb_cObject);

  return rb_cConnection;
}
