
#import "DetailViewController.h"

@implementation DetailViewController
@synthesize webView;

- (void)dealloc {
  [webView release];
  [super dealloc];
}

#pragma mark -
#pragma mark View lifecycle

- (void)loadView {
  
  UIView *mainParentView = [[UIView alloc] initWithFrame:CGRectZero];
  
  self.webView = [[UIWebView alloc] initWithFrame:CGRectZero];
  
  self.view = mainParentView;

  [mainParentView release];
  
  [self.view addSubview:self.webView];

  self.view.autoresizingMask    = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  self.view.autoresizesSubviews = YES;
}

- (void)viewDidLoad {
  
  [super viewDidLoad];
}

- (void)viewDidUnload {
 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {

  
  [super didReceiveMemoryWarning];
}


@end

