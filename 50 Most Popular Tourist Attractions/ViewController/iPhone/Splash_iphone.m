//
//  Splash_iphone.m
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/24/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import "Splash_iphone.h"
#import "TableVC_iphone.h"

@implementation Splash_iphone


-(void)tabbarPush{
	if (timer) {
		[timer invalidate];
		timer = nil;
	}
	
	TableVC_iphone *root = [[TableVC_iphone alloc] initWithNibName:@"TableVC_iphone" bundle:nil];
	[self.navigationController pushViewController:root animated:YES];
	
	[root release];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	[timer invalidate];
	timer=nil;
	
	[self tabbarPush];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;

    timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(tabbarPush) userInfo:nil repeats:NO];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
