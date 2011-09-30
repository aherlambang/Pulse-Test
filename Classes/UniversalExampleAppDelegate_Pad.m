

#import "UniversalExampleAppDelegate_Pad.h"
#import "RootViewController.h"
#import "RKEntry.h"
#import "RKMedia.h"
#import <RestKit/RestKit.h>
#import <RestKit/Support/JSON/JSONKit/RKJSONParserJSONKit.h>

@implementation UniversalExampleAppDelegate_Pad

@synthesize window;
@synthesize splitViewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    RKObjectManager* objectManager = [RKObjectManager objectManagerWithBaseURL:@"https://ajax.googleapis.com/ajax/services/feed"];
    [[RKParserRegistry sharedRegistry] setParserClass:[RKJSONParserJSONKit class] forMIMEType:@"text/javascript"];
    
    RKObjectMapping* mediaMapping = [RKObjectMapping mappingForClass:[RKMedia class]];
    [mediaMapping mapKeyPath:@"url" toAttribute:@"url"];
    [mediaMapping mapKeyPath:@"medium" toAttribute:@"medium"];
    [mediaMapping mapKeyPath:@"title" toAttribute:@"title"];
    [mediaMapping mapKeyPath:@"thumbnails" toAttribute:@"thumbnails"];
    
    RKObjectMapping* entryMapping = [RKObjectMapping mappingForClass:[RKEntry class]];
    [entryMapping mapKeyPath:@"title" toAttribute:@"title"]; 
    [entryMapping mapKeyPath:@"link" toAttribute:@"link"]; 
    [entryMapping mapKeyPath:@"author" toAttribute:@"author"]; 
    [entryMapping mapKeyPath:@"publishedDate" toAttribute:@"publishedDate"]; 
    [entryMapping mapKeyPath:@"content" toAttribute:@"content"]; 
    [entryMapping mapKeyPath:@"categories" toAttribute:@"categories"]; 
    [entryMapping mapKeyPath:@"mediaGroups.@unionOfArrays.contents" toRelationship:@"mediaGroups" withMapping:mediaMapping];
    [objectManager.mappingProvider setMapping:entryMapping forKeyPath:@"responseData.feed.entries"];  
    
    
    RKLogConfigureByName("RestKit", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelDebug);
    RKLogConfigureByName("RestKit/Network/Queue", RKLogLevelDebug);
    
  [window addSubview:splitViewController.view];
  [window makeKeyAndVisible];
  
  return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
   */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  /*
   Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
   */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}


- (void)applicationWillTerminate:(UIApplication *)application {
  /*
   Called when the application is about to terminate.
   See also applicationDidEnterBackground:.
   */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
  /*
   Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
   */
}


- (void)dealloc {
	[window release];
  [splitViewController release];
	[super dealloc];
}


@end

