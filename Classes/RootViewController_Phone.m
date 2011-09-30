

#import "RootViewController_Phone.h"
#import "RKEntry.h"

@implementation RootViewController_Phone

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  DetailViewController_Phone *detail = [[DetailViewController_Phone alloc] init];
  
  RKEntry * entry = [self.results objectAtIndex:indexPath.row];
  detail.urlString = entry.content;
  detail.title = entry.title;
  detail.urlLink = entry.link;

  [self.navigationController pushViewController:detail animated:YES];
  
  [detail release];
}

@end
