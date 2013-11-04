#import <Cocoa/Cocoa.h>
#import <ImageCaptureCore/ImageCaptureCore.h>

@interface CamBrowser: NSObject {
  ICDeviceBrowser* mDevBrowser;
  NSMutableArray* mCams;
}

@property(retain) NSMutableArray* cameras;

@end
