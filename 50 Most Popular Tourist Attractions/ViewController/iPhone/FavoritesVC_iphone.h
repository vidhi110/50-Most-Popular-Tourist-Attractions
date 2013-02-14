//
//  FavoritesVC_iphone.h
//  50 Most Popular Tourist Attractions
//
//  Created by  on 1/24/12.
//  Copyright (c) 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesVC_iphone : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
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
