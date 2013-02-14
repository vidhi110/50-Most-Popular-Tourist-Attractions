//
//  TableVC_ipad.m
//  50 Most Popular Tourist Attractions
//
//  Created by Umang Shah on 2/22/12.
//  Copyright (c) 2012 NVIDIA. All rights reserved.
//

#import "TableVC_ipad.h"
#import "Splash_ipad.h"
#import "Database.h"
#import "FavoriteVC_ipad.h"
#import "TableDetailVC_ipad.h"
#import "InfoVC_ipad.h"


@implementation TableVC_ipad

@synthesize fav_check;

-(IBAction)GoToFav{
    
    FavoriteVC_ipad *root = [[FavoriteVC_ipad alloc] initWithNibName:@"FavoriteVC_ipad" bundle:nil];
    // [UIView beginAnimations:nil context:NULL];
	//[UIView setAnimationDuration:1.0];
	//[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
	[self.navigationController pushViewController:root animated:YES];
	//[UIView commitAnimations];
	
	[root release];
}
-(IBAction)GoToInfo{
    
    InfoVC_ipad *obj=[[InfoVC_ipad alloc]initWithNibName:@"InfoVC_ipad" bundle:nil];
    //[UIView beginAnimations:nil context:NULL];
	//[UIView setAnimationDuration:1.0];
	//[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
	[self.navigationController pushViewController:obj animated:YES];
	//[UIView commitAnimations];
    [obj release];
    
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
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{   
    dataArray = [Database executeQuery:@"select * from TouristAttractions"];
    table.backgroundColor = [UIColor clearColor];
    [table reloadData];
    
    favArray = [Database executeQuery:@"select * from TouristAttractions where fav = 1"];
    NSInteger count = [favArray count];
    fav_count.text = [NSString stringWithFormat:@"%d",count];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
   	cell.textLabel.numberOfLines=1;
    
    UILabel *lbl =[[[UILabel alloc]init] autorelease];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    imgCell = [[UIImageView alloc ]initWithImage:[UIImage imageNamed:@"thumbnail_strip_ipad.png"]]; 
    imgCell.frame = CGRectMake(45,20, 768, 100 );
    
    
    [cell.contentView addSubview:imgCell];
    
    
    
    lbl.textColor=[UIColor whiteColor];
    lbl.frame=CGRectMake(80, -5, 250, 65);
    
    lbl.numberOfLines = 2;
    lbl.backgroundColor=[UIColor clearColor];
    
    NSDictionary *dict1=[dataArray objectAtIndex:indexPath.row];
    NSString *str1 = [dict1 objectForKey:@"place"];
    
    lbl.text=str1;
    lbl.font = [UIFont systemFontOfSize:17];
    lbl.baselineAdjustment=UIBaselineAdjustmentAlignCenters;
    
    [[cell contentView] addSubview:lbl];
    
    NSInteger fav_local = [[dict1 objectForKey:@"fav"] integerValue];
    if (fav_local == 1) {
        
        UIImageView *imageView = [[UIImageView alloc ]initWithImage:[UIImage imageNamed:@"star_1.png"]];
        imageView.frame = CGRectMake(450,20,17,18);// 25....
        [[cell contentView] addSubview:imageView];
        [imageView release];
        
    }
    
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
    
    [lbl release];
    [dict1 release];
    [str1 release];
    [strImage release];
    [img release];
    [imageView release];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableDetailVC_ipad *obj_Detail =[[ TableDetailVC_ipad alloc] initWithNibName:@"TableDetailVC_ipad" bundle:nil];
    
    NSMutableDictionary *dict1 = [dataArray objectAtIndex:indexPath.row];
    NSString *strName_local = [dict1 objectForKey:@"place"];
    NSString *imgName_local = [dict1 objectForKey:@"images"];
    NSString *detail_local = [dict1 objectForKey:@"country"];
    NSInteger tableid_local = [[dict1 objectForKey:@"id"] integerValue];
    
    
    strName_local = [strName_local stringByAppendingString:@", "];
    strName_local = [strName_local stringByAppendingString: detail_local];
    
    NSString *description_local = [dict1 objectForKey:@"description"];
    NSString *attraction_local = [dict1 objectForKey:@"attraction"];
    NSString *otherInfo_local = [dict1 objectForKey:@"otherinfo"];    
    NSUInteger Fav_Flag_local = [[dict1 objectForKey:@"fav"]integerValue];
    
    
    obj_Detail.number = tableid_local;
    obj_Detail.FavFlag = Fav_Flag_local;
    obj_Detail.strName = strName_local;
    obj_Detail.imgSrc = imgName_local;
    obj_Detail.description = description_local;
    obj_Detail.attract = attraction_local;
    obj_Detail.otherInfo = otherInfo_local;
    
    
    // [UIView beginAnimations:nil context:NULL];
	//[UIView setAnimationDuration:1.0];
	//[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
	//[UIView commitAnimations];
    [self.navigationController pushViewController:obj_Detail animated:YES];
    [obj_Detail release];
    
    
}

-(void)dealloc
{
    [dataArray release];
    [table release];
    [imgCell release];
    [fav release];
    [info release];    
    
}



- (void)viewDidUnload
{
    [table release];
    [imgCell release];
    [fav release];
    [info release];   
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
	//return YES;
}

@end
