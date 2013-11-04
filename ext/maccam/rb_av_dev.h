#ifndef _RB_AV_DEV_H
#define _RB_AV_DEV_H

#include <ruby.h>
#import <AVFoundation/AVFoundation.h>

VALUE Init_device(VALUE outer);
VALUE Init_still_image_output(VALUE outer, VALUE conn);
VALUE Init_connection(VALUE outer);
VALUE Init_session(VALUE outer);

#endif
