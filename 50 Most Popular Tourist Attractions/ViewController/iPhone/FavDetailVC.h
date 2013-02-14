//
//  FavDetailVC.h
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/30/12.
//  Copyright (c) 2012 . All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "FBFeedPost.h"
#import "IFNNotificationDisplay.h"


@class Reachability;

@interface FavDetailVC : UIViewController<MFMailComposeViewControllerDelegate,UIWebViewDelegate,UIScrollViewDelegate>
{
    IBOutlet UIWebView *web;
    IBOutlet UIScrollView *scroll;
    IBOutlet UIPageControl *page11;
    IBOutlet UIButton *detail;
    
    IBOutlet UIButton *desc;
    IBOutlet UIButton *attraction;
    IBOutlet UIButton *info;
    IBOutlet UIButton *fb;
    IBOutlet UIButton *mail;
    IBOutlet UIButton *imageShow;
    IBOutlet UIButton *image44;   
    IBOutlet UIImageView    *img_fotr;

    

    IBOutlet UIView *share_new;
    
    NSUInteger FavFlag;
    NSString *onlyName;
    int check;
    NSInteger FOUND;

       
    IBOutlet UILabel *lblname;
    NSString *strName; 
    NSMutableArray *dataArray;
    NSUInteger count;
    NSUInteger number;
    NSString *imgSrc;
    NSString *description;
    
    NSString *attract;
    NSString *history;
    NSString *otherInfo;
    
    Reachability* reachability;
    Reachability* ReachableViaWiFiNetwork;
    Reachability* ReachableViaCarrierDataNetwork;

 }
@property (nonatomic, readwrite) NSInteger FOUND;

@property (nonatomic,retain) NSString *attract;
@property (nonatomic,retain) NSString *otherInfo;
@property (nonatomic) NSUInteger FavFlag;


@property (nonatomic,retain) NSString *imgSrc;
@property (nonatomic,retain) NSString *description;
@property (nonatomic,retain) NSString *strName;
@property (nonatomic) NSUInteger number;
@property (nonatomic, retain) IBOutlet UIPageControl *page11;



-(IBAction)Details:(id)sender;

-(IBAction)BackMtd:(id)sender;
-(IBAction)ShowDetailsWeb:(id)sender;
//-(IBAction)HideBar;
-(IBAction)ShowBar;
-(IBAction)ShowDetailsWeb:(id)sender;
-(IBAction)HideButtons;
-(IBAction)EmailMtd:(id)sender;
-(void)displayComposerSheet;
-(IBAction)GoToFav;

-(IBAction)FaceBookMtd:(id)sender;
- (void) btnPostPress;
- (NSString *)flattenHTML:(NSString *) html;

-(void)showErrorMessage:(NSString*)message;
+(void)stop;


@end
