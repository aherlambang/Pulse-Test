

#import <Foundation/Foundation.h>
#import "DetailViewController.h"

@interface DetailViewController_Pad : DetailViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate> {
  UIToolbar *toolbar;
  UIPopoverController *popoverController;
}

@property (nonatomic, retain) UIToolbar *toolbar;

@end
