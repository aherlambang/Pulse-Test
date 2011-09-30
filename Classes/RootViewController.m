

#import "RootViewController.h"
#import "AsynchronousImageView.h"
#import "CustomCell.h"
#import "RKEntry.h"
#import "RKMedia.h"

@implementation RootViewController
@synthesize results;
@synthesize HUD;

- (void)dealloc {
  [HUD release];
  [results release];
  [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)timeout:(id)arg {
    HUD.labelText = @"Timeout!";
    HUD.detailsLabelText = @"Please try again later.";
    [self performSelector:@selector(dismissHUD:) withObject:nil afterDelay:2.0];
    
}

- (void)dismissHUD:(id)arg {
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"CALLING ROOT");
    
    /*
    if (_refreshHeaderView == nil) {
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
		[view release];
	} else {
    }
	
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
    */
    [self requestServer];
    
    self.results = [NSMutableArray array];
       [self setTitle:@"TechCrunch Feeds"];
}

- (void) requestServer
{
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    HUD.labelText = @"Fetching Data";
    [self performSelector:@selector(timeout:) withObject:nil afterDelay:30.0];
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    NSArray * arrObj = [NSArray arrayWithObjects:@"http://feeds.feedburner.com/TechCrunch", @"1.0", @"-1", nil];
    NSArray * keyObj = [NSArray arrayWithObjects:@"q", @"v", @"num", nil];
    [objectManager loadObjectsAtResourcePath:[@"/load" appendQueryParams: [NSDictionary dictionaryWithObjects:arrObj forKeys:keyObj]] delegate:self];

}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"CustomCell";
  
  CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
      NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
      cell = (CustomCell *)[nib objectAtIndex:0];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
  }

  
  RKEntry * entry = [self.results objectAtIndex:indexPath.row];
    
  NSString * picURL = [[entry.mediaGroups objectAtIndex:0] url];
  [((AsynchronousImageView *) cell.pic) loadImageFromURLString:picURL];
  [cell.title setText:entry.title];
   cell.title.delegate = self;
    
  return cell;
}

//call back after RKObjectLoader is returned
- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    [self.results removeAllObjects];
    [self.results addObjectsFromArray:objects];
    [self.tableView reloadData];
    [self doneLoadingTableViewData];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:textView.superview.superview];
    
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    return NO;  // specifies you don't want to edit the textView;
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
    [self requestServer];
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{	
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


- (void)viewDidUnload {
	_refreshHeaderView=nil;
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end

