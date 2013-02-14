//
//  InfoVC_ipad.m
//  50 Most Popular Tourist Attractions
//
//  Created by Umang Shah on 2/22/12.
//  Copyright (c) 2012 NVIDIA. All rights reserved.
//

#import "InfoVC_ipad.h"
#import "TableVC_ipad.h"

@implementation InfoVC_ipad
@synthesize layout_check;


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
    web.backgroundColor = [UIColor clearColor];
    web.opaque = NO;
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Aboutus" ofType:@"html"]isDirectory:NO]]];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)MtdBack:(id)sender
{
    TableVC_ipad *home = [[TableVC_ipad alloc]initWithNibName:@"TableVC_ipad" bundle:nil];
    // [UIView beginAnimations:nil context:NULL];
    //	[UIView setAnimationDuration:1.0];
    //	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    //	[self.navigationController pushViewController:home animated:YES];
    
	[self.navigationController popViewControllerAnimated:YES];
    //	[UIView commitAnimations];
    
    [home release];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) 
    {
    }
    
    else
    {
        
    }   
    
    // Return YES for supported orientations
	return YES;
}

- (void) updateLayoutForNewOrientation: (UIInterfaceOrientation) orientation
{
    if (UIInterfaceOrientationIsLandscape(orientation))
        
    {
    }
    
    else
    {
        
    } 
    
}


@end
