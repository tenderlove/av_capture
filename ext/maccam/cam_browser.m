#import "cam_browser.h"

@implementation CamBrowser

@synthesize cameras = mCams;

- (id)init {
  self = [super init];

  if(self) {
    mCams = [[NSMutableArray alloc] initWithCapacity:0];
    mDevBrowser = [[ICDeviceBrowser alloc] init];
    mDevBrowser.delegate = self;
    mDevBrowser.browsedDeviceTypeMask =
        mDevBrowser.browsedDeviceTypeMask
      | ICDeviceTypeMaskCamera
      | ICDeviceLocationTypeMaskLocal
      | ICDeviceLocationTypeMaskShared
      | ICDeviceLocationTypeMaskBonjour
      | ICDeviceLocationTypeMaskBluetooth
      | ICDeviceLocationTypeMaskRemote;

    NSLog(@"testing");
    [mDevBrowser start];
    NSLog(@"testing");
  }

  return self;
}

- (void)deviceBrowser:(ICDeviceBrowser*)browser didAddDevice:(ICDevice*)addedDevice moreComing:(BOOL)moreComing
{
    printf("HI MOM!\n");
}
 
 
/*----------------------------------------------------------------------------------------------- deviceBrowser:didRemoveDevice: */
 
/* The required delegate method didRemoveDevice will handle the removal of camera devices. This message is sent to 
 the delegate to inform that a device has been removed.
 */
- (void)deviceBrowser:(ICDeviceBrowser*)browser didRemoveDevice:(ICDevice*)device moreGoing:(BOOL)moreGoing
{
    printf("HI MOM!\n");
}

@end
