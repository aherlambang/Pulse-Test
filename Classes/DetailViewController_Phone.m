

#import "DetailViewController_Phone.h"
#import "SHK.h"

@implementation DetailViewController_Phone
@synthesize urlString;
@synthesize title;
@synthesize urlLink;

- (void)share
{
	// Create the item to share (in this example, a url)
	NSURL *url = [NSURL URLWithString:urlString];
	SHKItem *item = [SHKItem URL:url title:title];
    
	// Get the ShareKit action sheet
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
	// Display the action sheet
	[actionSheet showFromToolbar:self.navigationController.toolbar];
}


- (void)viewDidLoad {

  CGRect tblFrame;

  /**
   *  Hard code values for frames are NOT recommended, but here for breavity sake
   */
    
  self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                  target:self
                                                  action:@selector(share)];

  tblFrame = CGRectMake(0, 0, 320, 480);
    
  self.webView.frame = tblFrame;

    [self.webView loadHTMLString:urlString baseURL:nil];
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)dealloc {
  [urlLink release];
  [title release];
  [urlString release];
  [super dealloc]; 
}


@end
