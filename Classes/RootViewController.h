
#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "EGORefreshTableHeaderView.h"
#import "MBProgressHUD.h"

@interface RootViewController : UITableViewController <RKObjectLoaderDelegate, EGORefreshTableHeaderDelegate, UITextViewDelegate> {
    NSMutableArray * results;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    MBProgressHUD * HUD;

}

@property (nonatomic, retain) NSMutableArray * results;
@property (retain) MBProgressHUD * HUD;

- (void) requestServer;
- (void)doneLoadingTableViewData;

@end
