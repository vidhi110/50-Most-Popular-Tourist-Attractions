//
//  FavDetailVC.m
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/30/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import "FavDetailVC.h"
#import "Database.h"
#import "AppDelegate.h"
#import "FavoritesVC_iphone.h"
#import "Reachability.h"



#define UIAppDelegate \
((AppDelegate *)[UIApplication sharedApplication].delegate)


@implementation FavDetailVC

@synthesize strName,imgSrc,description,attract,otherInfo,FavFlag,number,FOUND,page11;

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    int page=scroll.contentOffset.x / scroll.frame.size.width;
    
    page11.currentPage=page;
    
}


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
    dataArray = [Database executeQuery:@"select * from TouristAttractions"];
   // share.hidden=YES;
    
    check=0;

    
}


-(IBAction)BackMtd:(id)sender
{
  
    [self.navigationController popViewControllerAnimated:YES];
    //[UIView commitAnimations];
}


-(IBAction)Details:(id)sender
{
    [self ShowDetailsWeb:desc];
    
    
    web.hidden=YES;
    share_new.alpha=1;
    [share_new setFrame:CGRectMake(0,395, 320, 100)];
    [self.view addSubview:share_new];
    
    share_new.hidden=NO;
    
    [self ShowDetailsWeb:desc];
    
    img_fotr.hidden=NO;
    
    [UIView beginAnimations:nil context:nil];  
    [UIView setAnimationDuration:1.5];
    web.alpha =1.5;
    [self.view addSubview:web];
    [UIView commitAnimations];
    
    scroll.alpha=0.5;
    
    
    desc.hidden = NO;
    attraction.hidden = NO;
    info.hidden = NO;
    fb.hidden=NO;
    mail.hidden=NO;
    [imageShow setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"down" ofType:@"png"]] forState:UIControlStateNormal];
    
    
}

-(IBAction)ShowDetailsWeb:(id)sender{
    page11.hidden = YES;
    NSURL *baseURL = [NSURL fileURLWithPath:
                      [[NSBundle mainBundle] bundlePath]];
    desc.enabled = NO;
    attraction.enabled = YES;
    info.enabled = YES;
    [web loadHTMLString:[NSString stringWithFormat:@"<font size='3' face='Verdana' color='black' text-aling:'left-justify'>%@</font>",attract] baseURL:baseURL];
    
    imageShow.hidden = NO;
    
    if(web.hidden == YES){
        web.hidden = NO;
        
    }
    
    
    if (sender == desc){
        desc.enabled = NO;
        attraction.enabled = YES;
        info.enabled = YES;
        [web loadHTMLString:[NSString stringWithFormat:@"<font size='3' face='Verdana' color='black' text-aling:'left-justify'>%@</font>",description] baseURL:baseURL];
        
        [desc setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"description_actv" ofType:@"png"]] forState:UIControlStateNormal];
        [attraction setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"details" ofType:@"png"]] forState:UIControlStateNormal];
        [info setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"other_info" ofType:@"png"]] forState:UIControlStateNormal];
        [web loadHTMLString:[NSString stringWithFormat:@"<font size='3' face='Verdana' color='black' text-aling:'left-justify'>%@</font>",description] baseURL:baseURL];
        
        
    }
    else if (sender == attraction){
        desc.enabled = YES;
        attraction.enabled = NO;
        info.enabled = YES;
        [web loadHTMLString:[NSString stringWithFormat:@"<font size='3' face='Verdana' color='black' text-aling:'left-justify'>%@</font>",attract] baseURL:baseURL];  
        
        
        [attraction setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"details_actv" ofType:@"png"]] forState:UIControlStateNormal];
        
        [desc setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"description" ofType:@"png"]] forState:UIControlStateNormal];
        [info setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"other_info" ofType:@"png"]] forState:UIControlStateNormal];

        
    }

    else if (sender == info){
        desc.enabled = YES;
        attraction.enabled = YES;
        info.enabled = NO;
        
        [web loadHTMLString:[NSString stringWithFormat:@"<font size='3' face='Verdana' color='black' text-aling:'left-justify'>%@</font>",otherInfo] baseURL:baseURL];
        
        [attraction setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"details" ofType:@"png"]] forState:UIControlStateNormal];
        
        [info setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"other_info_actv" ofType:@"png"]] forState:UIControlStateNormal];
        
        [desc setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"description" ofType:@"png"]] forState:UIControlStateNormal];
        

        
    }
    web.backgroundColor = [UIColor clearColor];
    web.opaque = NO;    
    scroll.alpha = 0.5;
    
}

+(void)stop
{
	[[UIAppDelegate indicator] stopAnimating];
}

-(void)viewWillAppear:(BOOL)animated
{   
    page11.hidden=NO;
    
  //  detail.hidden=NO;
    
    img_fotr.hidden=YES;

    [UIAppDelegate indicator].frame = CGRectMake(130, 195, 60, 60);
    [self.view addSubview:[UIAppDelegate indicator]];
    
    lblname.text =strName;
    
    scroll.alpha = 1.0;
    
    imageShow.hidden = YES;
    
    web.hidden = YES;
    
    [share_new setFrame:CGRectMake(0,700,123, 300)];
    
   // [self HideBar];
   // [self ShowBar];

    count = 1;
    
    page11.hidden=NO;
    page11.numberOfPages = 3;
    page11.currentPage = 0;
    
    
    scroll.backgroundColor = [UIColor clearColor];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    scroll.contentSize=CGSizeMake(320*3, 450);
    scroll.frame = CGRectMake(0, 40, 320, 450);
    scroll.scrollEnabled = YES;
    NSDictionary *dict = [dataArray objectAtIndex:(number-1)];
    NSString *strimage = [dict objectForKey:@"images"]; 
    strimage =[strimage substringToIndex:[strimage length]];
    for(int i=1; i<=3; i++)
    {
        NSString *mystr=[NSString stringWithFormat:@"%@%d",strimage,i];
        UIImage *img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:mystr ofType:@"jpg"]];
        UIImageView *tem=[[[UIImageView alloc]init] autorelease];
        tem.frame=CGRectMake(320*(i-1), 0, 320, 450);
        tem.image=img;
        [scroll addSubview:tem];
    }
}


-(IBAction)GoToFav{
    
    FavoritesVC_iphone *root = [[FavoritesVC_iphone alloc] initWithNibName:@"FavoritesVC_iphone" bundle:nil];
  
	[self.navigationController pushViewController:root animated:YES];
	//[UIView commitAnimations];
	
	[root release];
    
    
}

-(IBAction)HideButtons{
    
    
    img_fotr.hidden=YES;
    
    web.hidden=YES;
    desc.hidden = YES;
    attraction.hidden = YES;
    info.hidden = YES;
    
    fb.hidden=YES;
    mail.hidden=YES;
    
    scroll.alpha=1;
    
    
    
    [imageShow setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"up_green" ofType:@"png"]] forState:UIControlStateNormal];
    
    
    share_new.hidden=YES;
        
      
}

#pragma mark  - Email Method

-(IBAction)EmailMtd:(id)sender
{
    [self displayComposerSheet];
}

-(void)displayComposerSheet 
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	NSString *stringtitle=[NSString stringWithFormat:@"%@ (50 Most Popular Tourist Attractions)",lblname.text];
	[picker setSubject:stringtitle];
    
   // NSMutableDictionary *dict1 = [dataArray objectAtIndex:0];
	
    NSString *emailBody = [NSString stringWithFormat:@"%@",description];     
    
    NSBundle *bundle = [NSBundle mainBundle]; 
    NSString *strimgname=[NSString stringWithFormat:@"%@%d",imgSrc,1];

    
   // NSString *strimgname =[dict1 objectForKey:@"Image"]; 
    
    
    NSString *path = [bundle pathForResource:strimgname ofType:@"jpg"];
    NSData *myData = [NSData dataWithContentsOfFile:path]; 
    
    [picker addAttachmentData:myData mimeType:@"image/png"fileName:@"recipes.jpg"];
    
    [picker setMessageBody:emailBody isHTML:YES];
	
	[self presentModalViewController:picker animated:YES];
    [picker release];
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{    
	switch (result)
	{
		case MFMailComposeResultCancelled:
			NSLog(@"canceled");
			break;
		case MFMailComposeResultSaved:
			NSLog(@"saved");
			break;
		case MFMailComposeResultSent:
			NSLog(@"sent");
			[self showErrorMessage: @"Email sent successfully"];
			break;
		case MFMailComposeResultFailed:
			NSLog(@"failed");
			[self showErrorMessage: @"Failed to send email"];
			break;
		default:
			NSLog(@"not sent");
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

-(void)showErrorMessage:(NSString*)message
{
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Mail" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
	[alert show];
	[alert release];
}


# pragma mark -Facebook

-(IBAction)FaceBookMtd:(id)sender

{
    
    reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    
    
    if(remoteHostStatus == NotReachable) 
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Network Not Found" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alert show];
    }
    else
    {
        [self btnPostPress];
        
    }    
    
}	

//________________________________________Facebook Method__________________________________________________________________

- (void) btnPostPress {
	NSHTTPCookieStorage* cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage];
	NSArray* facebookCookies = [cookies cookiesForURL:
								[NSURL URLWithString:@"http://login.facebook.com"]];
	
	for (NSHTTPCookie* cookie in facebookCookies) {
		[cookies deleteCookie:cookie];
	}
	
    NSString *FBBody = [NSString stringWithFormat:@"%@",description];  
    
    NSString *strFlat= [self flattenHTML:FBBody];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:
					[[NSBundle mainBundle] pathForResource:imgSrc ofType:@"jpg"]];
    
    // NSString *str2=[strFlat stringByAppendingFormat:str];
    
    //FBFeedPost *post = [[FBFeedPost alloc] initWithPostMessage:strFlat];
    
    FBFeedPost *post = [[FBFeedPost alloc] initWithPhoto:img name:strFlat];
    
    
    [post publishPostWithDelegate:self];
    [[UIAppDelegate indicator] startAnimating];
	IFNNotificationDisplay *display = [[IFNNotificationDisplay alloc] init];
	display.type = NotificationDisplayTypeLoading;
	display.tag = NOTIFICATION_DISPLAY_TAG;
    
    [img release];
	[display release];
}

#pragma mark -
#pragma mark FBFeedPostDelegate



- (void) failedToPublishPost:(FBFeedPost*) _post {
    
    UIView *dv = [self.view viewWithTag:NOTIFICATION_DISPLAY_TAG];
    [dv removeFromSuperview];
    
    IFNNotificationDisplay *display = [[IFNNotificationDisplay alloc] init];
    display.type = NotificationDisplayTypeText;
    [display setNotificationText:@"Failed To Post"];
    [[UIAppDelegate indicator] stopAnimating];
    [display displayInView:self.view atCenter:CGPointMake(self.view.center.x, self.view.center.y-100.0) withInterval:1.5];
    
    [display release];
    //release the alloc'd post
    
}

- (void) finishedPublishingPost:(FBFeedPost*) _post {
    
    UIView *dv = [self.view viewWithTag:NOTIFICATION_DISPLAY_TAG];
    [dv removeFromSuperview];
    
    IFNNotificationDisplay *display = [[IFNNotificationDisplay alloc] init];
    display.type = NotificationDisplayTypeText;
    [display setNotificationText:@"Finished Posting"];
    [display displayInView:self.view atCenter:CGPointMake(self.view.center.x, self.view.center.y-100.0) withInterval:1.5];
    [[UIAppDelegate indicator] stopAnimating];
    [display release];
    //release the alloc'd post
}

- (NSString *)flattenHTML:(NSString *) html {
	NSScanner *theScanner;
	NSString *text = nil;
	theScanner = [NSScanner scannerWithString:html];
	while ([theScanner isAtEnd] == NO) {
		
		[theScanner scanUpToString:@"<" intoString:NULL] ;
		
		[theScanner scanUpToString:@">" intoString:&text] ;
		
		html = [html stringByReplacingOccurrencesOfString:
				[ NSString stringWithFormat:@"%@>", text]
											   withString:@""];
	}
	return html;
}


- (void)viewDidUnload
{
    [lblname release];
    [strName release];
    [dataArray release];
    [imgSrc release];
    [description release];
    [attract release];
    [history release];
    [otherInfo release];
    
    [imageShow release];
    [image44 release];
    [detail release];
    [web release];
    [share_new release];
    [desc release];
    [attraction release];
    [info release];
    
    [super viewDidUnload];
    
}
-(void)dealloc
{
    [lblname release];
    [strName release];
    [imgSrc release];    
    [imageShow release];
    [image44 release];
    [detail release];
    [web release];
    [share_new release];
    [desc release];
    [attract release];
    [info release];
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
