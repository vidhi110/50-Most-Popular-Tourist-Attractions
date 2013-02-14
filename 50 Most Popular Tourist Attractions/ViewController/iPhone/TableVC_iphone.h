//
//  TableVC_iphone.h
//  50 Most Popular Tourist Attractions
//
//  Created by    on 1/24/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableVC_iphone : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray          *dataArray;
    
    IBOutlet UITableView    *table;
    IBOutlet UIImageView    *imgCell;
    IBOutlet UIButton       *fav;
    IBOutlet UIButton       *info;
    
    IBOutlet UIImageView    *thumbnail;

    
    NSInteger               fav_check;
    
    IBOutlet UILabel        *fav_count;
    NSMutableArray          *favArray;
}

@property (nonatomic, readwrite) NSInteger fav_check;

-(IBAction)GoToFav;
-(IBAction)GoToInfo;


@end
