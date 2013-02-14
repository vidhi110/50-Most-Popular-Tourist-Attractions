//
//  AppDelegate.h
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/24/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIActivityIndicatorView *indicator;
}

+(AppDelegate*)appDelegate;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property(nonatomic,retain)IBOutlet UIActivityIndicatorView *indicator;

- (void)createEditableCopyOfDatabaseIfNeeded;

@end
