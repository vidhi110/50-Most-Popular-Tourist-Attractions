//
//  InfoVC_ipad.h
//  50 Most Popular Tourist Attractions
//
//  Created by Umang Shah on 2/22/12.
//  Copyright (c) 2012 NVIDIA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoVC_ipad : UIViewController
{
IBOutlet UIImageView *Img;
IBOutlet UIImageView *NavImg;

IBOutlet UIWebView *web;

IBOutlet UIButton *BackBtn;

NSInteger layout_check;


int layout;
}
@property(nonatomic, readwrite)NSInteger layout_check;

-(IBAction)MtdBack:(id)sender;

@end
