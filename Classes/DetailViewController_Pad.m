
#import "DetailViewController_Pad.h"


@interface DetailViewController_Pad()
  @property (nonatomic, retain) UIPopoverController *popoverController;
@end

@implementation DetailViewController_Pad

@synthesize toolbar;
@synthesize popoverController;

- (void)dealloc {
  [toolbar release];
  [popoverController release];
  [super dealloc];
}

- (void)viewDidLoad {
  
  /**
   *  Hard code values for frames are NOT recommended, but here for breavity sake
   */
  
  [super viewDidLoad];

  self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
  self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
  
  CGRect tbFrame;
  CGRect tblFrame;

  tbFrame  = CGRectMake(0, 0, 1024, 44);
  
  self.toolbar.frame = tbFrame;
  
  [self.view addSubview:self.toolbar];

  tblFrame = CGRectMake(0, 44, 704, 768);
    
  self.webView.frame = tblFrame;
    
  [self.view addSubview:self.toolbar];
  [self.view bringSubviewToFront:self.toolbar];
}


- (void)viewDidUnload {
  self.toolbar = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark -
#pragma mark SplitView
- (void)splitViewController:(UISplitViewController*)svc 
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem 
       forPopoverController: (UIPopoverController*)pc {
  
  barButtonItem.title = @"Main Bar Button Item";
  
  [self.toolbar setItems:[NSArray arrayWithObject:barButtonItem] animated:YES];
  
  self.popoverController = pc;
}

- (void)splitViewController: (UISplitViewController*)svc 
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem { 
  
  [self.toolbar setItems:[NSArray array] animated:YES];
  
  self.popoverController = nil;
}

@end
