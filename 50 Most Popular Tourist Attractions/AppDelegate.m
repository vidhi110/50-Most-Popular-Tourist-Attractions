//
//  AppDelegate.m
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/24/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import "AppDelegate.h"
#import "Database.h"

#import "Splash_iphone.h"
#import "Splash_ipad.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize indicator;
@synthesize navigationController = _navigationController;

+(AppDelegate*)appDelegate
{
    
	return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        Splash_iphone *masterViewController = [[Splash_iphone alloc] initWithNibName:@"Splash_iphone" bundle:nil];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        self.window.rootViewController = self.navigationController;
    } 
    else {
        Splash_ipad *masterViewController = [[[Splash_ipad alloc] initWithNibName:@"Splash_ipad" bundle:nil] autorelease];
        self.navigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
        self.window.rootViewController = self.navigationController;
    }
    
    indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	
	indicator.backgroundColor=[UIColor blackColor];
    
    [self createEditableCopyOfDatabaseIfNeeded];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)awakeFromNib{
	[super awakeFromNib];
    [self createEditableCopyOfDatabaseIfNeeded];
    
}


- (void)createEditableCopyOfDatabaseIfNeeded {
	
	NSLog(@"Creating editable copy of 50 Most Popular Tourist Attractions In The World");
	BOOL success;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"50 Most Popular Tourist Attractions In The World"];
	success = [fileManager fileExistsAtPath:writableDBPath];
	if (success) return;
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"50 Most Popular Tourist Attractions In The World"];
	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	if (!success) {
		NSAssert1(0, @"Failed to create writable 50 Most Popular Tourist Attractions In The World file with message '%@'.", [error localizedDescription]);
	}
}


- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
