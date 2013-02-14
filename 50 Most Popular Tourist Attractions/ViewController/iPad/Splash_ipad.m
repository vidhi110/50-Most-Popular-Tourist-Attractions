//
//  Splash_ipad.m
//  50 Most Popular Tourist Attractions
//
//  Created by Umang Shah on 2/22/12.
//  Copyright (c) 2012 NVIDIA. All rights reserved.
#import "TableVC_ipad.h"
#import "Splash_ipad.h"

@implementation Splash_ipad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(tabbarPush) userInfo:nil repeats:NO];
}

-(void)tabbarPush{
	if (timer) {
		[timer invalidate];
		timer = nil;
	}
	
	TableVC_ipad *root = [[TableVC_ipad alloc] initWithNibName:@"TableVC_ipad" bundle:nil];
	//[UIView beginAnimations:nil context:NULL];
	//[UIView setAnimationDuration:1.0];
	//[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
	[self.navigationController pushViewController:root animated:YES];
	//[UIView commitAnimations];
	
	[root release];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	[timer invalidate];
	timer=nil;
	
	[self tabbarPush];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) 
    {
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:
                        [[NSBundle mainBundle] pathForResource:@"splash_ipad_landscape" ofType:@"png"]];
        splash.image = img;
        [img release];
    }
    
    else
    {
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:
                        [[NSBundle mainBundle] pathForResource:@"splash_ipad" ofType:@"png"]];
        splash.image = img;
        [img release];
    }
    
    // Return YES for supported orientations
	return YES;
}

@end
