//
//  InfoVC_iphone.h
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/25/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoVC_iphone : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *web;

}


@property(nonatomic,retain)IBOutlet UIWebView *web;
-(IBAction)MtdBack:(id)sender;


@end
