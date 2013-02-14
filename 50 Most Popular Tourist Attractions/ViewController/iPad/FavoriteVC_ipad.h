//
//  FavoriteVC_ipad.h
//  50 Most Popular Tourist Attractions
//
//  Created by Umang Shah on 2/22/12.
//  Copyright (c) 2012 NVIDIA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteVC_ipad : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray          *dataArray;
    IBOutlet UITableView    *table;
    IBOutlet UIImageView    *imgCell;
    IBOutlet UIButton       *remove_button;
    IBOutlet UILabel        *fav_label;
    IBOutlet UIImageView    *thumbnail;
    UIButton       *button;
    
    
    BOOL      isEdit;
    NSInteger FOUND;
    
}

-(IBAction)Back_To_Table;

@end