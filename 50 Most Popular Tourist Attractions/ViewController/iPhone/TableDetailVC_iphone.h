//
//  TableDetailVC_iphone.h
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/25/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>


#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

#import "FBFeedPost.h"
#import "IFNNotificationDisplay.h"


@class Reachability;


@interface TableDetailVC_iphone : UIViewController<MFMailComposeViewControllerDelegate,UIWebViewDelegate,UIScrollViewDelegate>
{
    IBOutlet UIView         *share_new;    
    IBOutlet UIWebView      *web;
    IBOutlet UIScrollView   *scroll;
    IBOutlet UIPageControl  *page11;
    IBOutlet UIButton       *detail;
    IBOutlet UIImageView    *img_fotr;

    
    IBOutlet UIButton *desc;
    IBOutlet UIButton *attraction;
    IBOutlet UIButton *info;
    IBOutlet UIButton *fav;
    IBOutlet UIButton *fb;
    IBOutlet UIButton *mail;
    IBOutlet UIButton *imageShow;
    IBOutlet UIButton *image44;
    

    NSUInteger  FavFlag;
    NSString    *onlyName;
    int         check;


    
    IBOutlet UILabel *lblname;
     NSString *strName; 
    NSMutableArray *dataArray;
    NSUInteger count;
    NSUInteger number;
    NSString *imgSrc;
    NSString *description;


    NSString *attract;
    NSString *otherInfo;
    
    IBOutlet UILabel *label;
    
    
    Reachability* reachability;
    Reachability* ReachableViaWiFiNetwork;
    Reachability* ReachableViaCarrierDataNetwork;
    
}
@property (nonatomic,retain) NSString *attract;
@property (nonatomic,retain) NSString *otherInfo;

@property (nonatomic) NSUInteger FavFlag;


@property (nonatomic,retain) NSString *imgSrc;
@property (nonatomic,retain) NSString *description;
@property (nonatomic,retain) NSString *strName;
@property (nonatomic) NSUInteger number;
@property (nonatomic, retain) IBOutlet UIPageControl *page11;

@property (nonatomic,retain) NSString *onlyName;

-(IBAction)Details:(id)sender;

-(IBAction)BackMtd:(id)sender;
-(IBAction)ShowDetailsWeb:(id)sender;
//-(IBAction)HideBar;
//-(IBAction)ShowBar;
-(IBAction)ShowDetailsWeb:(id)sender;
-(IBAction)HideButtons;
-(IBAction)EmailMtd:(id)sender;
-(void)displayComposerSheet;
-(void)showErrorMessage:(NSString*)message;


-(IBAction)FaceBookMtd:(id)sender;
- (void) btnPostPress;
- (NSString *)flattenHTML:(NSString *) html;

+(void)stop;





@end
