//
//  FBRequestWrapper.h
//  Facebook Demo
//
//  Created by Andy Yanok on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Facebook.h"

#define FB_APP_ID @"304131359641916"
#define FB_API_KEY @"304131359641916"
#define FB_APP_SECRET @"3e8441d52e5a6b11abca128e2e31f55e"

@interface FBRequestWrapper : NSObject <FBRequestDelegate, FBSessionDelegate> 
{
	Facebook *facebook;
	BOOL isLoggedIn;
}

@property (nonatomic, assign) BOOL isLoggedIn;

+ (id) defaultManager;
- (void) setIsLoggedIn:(BOOL) _loggedIn;
- (void) FBSessionBegin:(id<FBSessionDelegate>) _delegate;
- (void) FBLogout;
- (void) getFBRequestWithGraphPath:(NSString*) _path andDelegate:(id) _delegate;
- (void) sendFBRequestWithGraphPath:(NSString*) _path params:(NSMutableDictionary*) _params andDelegate:(id) _delegate;

@end
