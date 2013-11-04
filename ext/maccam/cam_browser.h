#import <Cocoa/Cocoa.h>
#import <ImageCaptureCore/ImageCaptureCore.h>

@interface CamBrowser: NSObject <ICDeviceBrowserDelegate> {
  ICDeviceBrowser* mDevBrowser;
  NSMutableArray* mCams;
}

@property(retain) NSMutableArray* cameras;

@end
