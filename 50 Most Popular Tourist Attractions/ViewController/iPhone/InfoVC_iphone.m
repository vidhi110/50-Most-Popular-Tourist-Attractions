//
//  InfoVC_iphone.m
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/25/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import "InfoVC_iphone.h"
#import "TableVC_iphone.h"

@implementation InfoVC_iphone
@synthesize web;

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
    web.backgroundColor = [UIColor clearColor];
    web.opaque = NO;
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Aboutus" ofType:@"html"]isDirectory:NO]]];
//    [super viewDidLoad];    
}

#pragma mark -Back Mtd

-(IBAction)MtdBack:(id)sender
{
    TableVC_iphone *home = [[TableVC_iphone alloc]initWithNibName:@"TableVC_iphone" bundle:nil];
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
    [web release];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
