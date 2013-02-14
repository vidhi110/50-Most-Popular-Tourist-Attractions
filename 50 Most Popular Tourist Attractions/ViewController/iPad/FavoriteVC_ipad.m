//
//  FavoriteVC_ipad.m
//  50 Most Popular Tourist Attractions
//
//  Created by Umang Shah on 2/22/12.
//  Copyright (c) 2012 NVIDIA. All rights reserved.
//
#import "TableVC_ipad.h"
#import "Database.h"
#import "FavDetailVC_ipad.h"
#import "TableDetailVC_ipad.h"

#import "FavoriteVC_ipad.h"

@implementation FavoriteVC_ipad

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

-(void)viewWillAppear:(BOOL)animated
{   
    dataArray = [Database executeQuery:@"select * from TouristAttractions where fav = 1"];
    FOUND = [dataArray count];
    if (FOUND == 0) {
        fav_label.text = @"No Favorites";
        remove_button.hidden = YES;
        table.hidden = YES;
    }
    else{
        fav_label.text = @"Favorites";
        remove_button.hidden = NO;
        table.hidden = NO;
    }
    [table reloadData];
}

-(IBAction)Back_To_Table{
    TableVC_ipad *root = [[TableVC_ipad alloc] initWithNibName:@"TableVC_ipad" bundle:nil];
	//[UIView beginAnimations:nil context:NULL];
	//[UIView setAnimationDuration:1.0];
	//[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
	[self.navigationController pushViewController:root animated:YES];
	//[UIView commitAnimations];
	
	[root release];
    
}

// Customize the number of sections in the table view.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.textColor=[UIColor blackColor];
    cell.backgroundColor=[UIColor clearColor];	
    
	cell.textLabel.numberOfLines=1;
    
    UILabel *lbl =[[[UILabel alloc]init] autorelease];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    imgCell = [[UIImageView alloc ]initWithImage:[UIImage imageNamed:@"thumbnail_strip_ipad.png"]]; 
    imgCell.frame = CGRectMake(5, 5, 768, 77 );
    [cell.contentView addSubview:imgCell];
    
    lbl.textColor=[UIColor whiteColor];
    lbl.frame=CGRectMake(80, -5, 250, 65);
    
    //  lbl.frame=CGRectMake(70, -5, 200, 65);
    lbl.numberOfLines = 2;
    lbl.backgroundColor=[UIColor clearColor];
    
    NSDictionary *dict1=[dataArray objectAtIndex:indexPath.row];
    NSString *str1 = [dict1 objectForKey:@"place"];    
    
    lbl.text=str1;
    lbl.font = [UIFont systemFontOfSize:17];
    lbl.baselineAdjustment=UIBaselineAdjustmentAlignCenters;
    
    [[cell contentView] addSubview:lbl];
    
    
    
    NSString *strImage = [dict1 objectForKey:@"images"];
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@_small.jpg",strImage]];   
    UIImageView *imageView = [[[UIImageView alloc]init] autorelease];
    thumbnail=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"thumbnail.png"]]; 
    thumbnail.frame = CGRectMake(15,12,50,40);
    [cell.contentView addSubview:thumbnail];
    
    imageView.image  =img;
    imageView.frame = CGRectMake(18,15,45,35);// 25....
    [[cell contentView] addSubview:imageView];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    FavDetailVC_ipad *obj_Detail =[[ FavDetailVC_ipad alloc] initWithNibName:@"FavDetailVC_ipad" bundle:nil];
    
    NSMutableDictionary *dict1 = [dataArray objectAtIndex:indexPath.row];
    NSString *strName = [dict1 objectForKey:@"place"];
    NSString *imgName = [dict1 objectForKey:@"images"];
    NSInteger tableid = [[dict1 objectForKey:@"id"] integerValue];
    NSString *description = [dict1 objectForKey:@"description"];
    NSString *attract = [dict1 objectForKey:@"attraction"];
    NSString *otherInfo = [dict1 objectForKey:@"otherinfo"];
    NSUInteger Fav_Flag_local = [[dict1 objectForKey:@"fav"]integerValue];
    
    
    obj_Detail.number = tableid;
    obj_Detail.FavFlag = Fav_Flag_local;
    obj_Detail.strName = strName;
    obj_Detail.imgSrc = imgName;
    obj_Detail.description = description;
    obj_Detail.attract = attract;
    obj_Detail.otherInfo = otherInfo;
    
    //  [UIView beginAnimations:nil context:NULL];
    //	[UIView setAnimationDuration:1.0];
    //	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    //	[UIView commitAnimations];
    [self.navigationController pushViewController:obj_Detail animated:YES];
    [obj_Detail release];
}

#pragma mark Edit Mtd

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath  
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        if(editingStyle == UITableViewCellEditingStyleDelete)
        {
            
            
            NSDictionary *dict1  = [dataArray objectAtIndex:indexPath.row];
            NSString *str1 = [dict1 objectForKey:@"description"];
            NSString *sanitized = [str1 stringByReplacingOccurrencesOfString:@"'"withString:@"''"];
            NSString *str2 = [NSString stringWithFormat:@"update TouristAttractions set fav = 0 where  description= '%@'",sanitized];
            
            if([Database executeQuery:str2])
            {
                dataArray = [Database executeQuery:@"select * from TouristAttractions where fav = 1"];
                
                [table reloadData];
                [self viewWillAppear:YES];
            }
        }
        
    }
    
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Delete";
}


-(IBAction)Editing:(BOOL)editing animated:(BOOL)animated
{
    table.hidden = NO;
    
    isEdit = !isEdit ;
    if(isEdit)
        
    {
        
        [remove_button setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"done_btn" ofType:@"png"]] forState:UIControlStateNormal];
        remove_button.titleLabel.text = @"Done";
        [super setEditing:YES animated:animated];
        [table setEditing:YES animated:animated];
        
    }
    else
    {
        [button setHidden:YES ];
        [remove_button setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"edit_btn" ofType:@"png"]] forState:UIControlStateNormal];
        remove_button.titleLabel.text = @"Done";
        [super setEditing:YES animated:animated];
        [table setEditing:NO animated:animated];
    }
    
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}




- (void)viewDidUnload
{
    [dataArray release];
    [table release];
    [imgCell release];
    [remove_button release];
    [fav_label release];
    
    
}

-(void)dealloc
{
    [dataArray release];
    [table release];
    [imgCell release];
    [remove_button release];
    [fav_label release];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
