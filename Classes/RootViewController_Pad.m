

#import "RootViewController_Pad.h"
#import "RKEntry.h"

@implementation RootViewController_Pad

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  UniversalExampleAppDelegate_Pad *delegate      = [[UIApplication sharedApplication] delegate];
  DetailViewController_Pad *detailViewController = (DetailViewController_Pad *)[delegate.splitViewController.viewControllers objectAtIndex:1];
    
  RKEntry * ven = [self.results objectAtIndex:indexPath.row];
  NSString * stringURL = ven.content;
  [detailViewController.webView loadHTMLString:stringURL baseURL:nil];

}

- (void)dealloc {
  [super dealloc];
}

- (void) viewDidLoad
{
    [self setTitle:@"TechCrunch Feeds"];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
}

@end
