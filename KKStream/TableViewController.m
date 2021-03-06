//
//  TableViewController.m
//  KKStream
//
//  Created by Jim Lai on 2017/8/10.
//  Copyright © 2017年 Jim Lai. All rights reserved.
//


#import "TableViewController.h"

@interface TableViewController ()
{
    NSMutableArray *parkNameSet;
    NSMutableArray *parkNameArray;
    NSMutableArray *openTimeArray;
    NSMutableArray *nameArray;
    NSMutableArray *introArray;
    NSMutableArray *imageArray;
    NSMutableArray *sectionCount;
}

@property (nonatomic, strong) NSMutableData *responseData;
@end

@implementation TableViewController
@synthesize parkNameSet;
@synthesize parkNameArray;
@synthesize openTimeArray;
@synthesize nameArray;
@synthesize introArray;
@synthesize imageArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    parkNameArray = [[NSMutableArray alloc]init];
    openTimeArray = [[NSMutableArray alloc]init];
    nameArray = [[NSMutableArray alloc]init];
    introArray = [[NSMutableArray alloc]init];
    imageArray = [[NSMutableArray alloc]init];
    sectionCount = [[NSMutableArray alloc]init];
    
    self.navigationItem.title = @"由於Opendata的圖片沒優化，請耐心等候...";
    
    NSString *urlAsString = [NSString stringWithFormat:@"http://data.taipei/opendata/datalist/datasetMeta/download;jsessionid=1FBB3B932B8E9CC90C863DF7639530E6?id=ea732fb5-4bec-4be7-93f2-8ab91e74a6c6&rid=bf073841-c734-49bf-a97f-3757a6013812"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithURL:[NSURL URLWithString:urlAsString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
    NSString *JSONString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *JSONdata = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    if (error != nil)
    {
        NSLog(@"error in NSURLSession is %@", [error localizedDescription]);
    }
    else
    {
        if(JSONdata!=NULL)
        {
            NSError *jsonError = nil;
            if (JSONdata != nil)
            {
                NSArray *itemArray = [NSJSONSerialization JSONObjectWithData:JSONdata options:0 error:&jsonError];
                if (jsonError == nil)
                {
                    NSString *tempLabel = @"aaa";
                    NSMutableArray *tempOpenTimeArray = [[NSMutableArray alloc]init];
                    NSMutableArray *tempNameArray = [[NSMutableArray alloc]init];
                    NSMutableArray *tempIntroArray = [[NSMutableArray alloc]init];
                    NSMutableArray *tempImageArray = [[NSMutableArray alloc]init];

                    for (NSDictionary *itemDic in itemArray)
                    {
                        NSString *parkNameString = [itemDic objectForKey:@"ParkName"];
                        NSString *openTimeString = [itemDic objectForKey:@"OpenTime"];
                        NSString *nameString = [itemDic objectForKey:@"Name"];
                        NSString *introString = [itemDic objectForKey:@"Introduction"];
                        NSString *imageString = [itemDic objectForKey:@"Image"];
                        if (![parkNameString isEqualToString:tempLabel])
                        {
                            if(!([tempOpenTimeArray count]==0))
                            {
                                [parkNameArray addObject:tempLabel];
                                [openTimeArray addObject:tempOpenTimeArray];
                                [nameArray addObject:tempNameArray];
                                [introArray addObject:tempIntroArray];
                                [imageArray addObject:tempImageArray];
                                tempOpenTimeArray = [[NSMutableArray alloc]init];
                                tempNameArray = [[NSMutableArray alloc]init];
                                tempIntroArray = [[NSMutableArray alloc]init];
                                tempImageArray = [[NSMutableArray alloc]init];
                             }
                        }
                        tempLabel = parkNameString;
                        [tempOpenTimeArray addObject:openTimeString];
                        [tempNameArray addObject:nameString];
                        [tempIntroArray addObject:introString];
                        [tempImageArray addObject:imageString];
                    }
                    if(!([tempOpenTimeArray count]==0))
                    {
                        [parkNameArray addObject:tempLabel];
                        [openTimeArray addObject:tempOpenTimeArray];
                        [nameArray addObject:tempNameArray];
                        [introArray addObject:tempIntroArray];
                        [imageArray addObject:tempImageArray];
                                
                    }
                            
                }
            }
        }
    }
    [self.tableView reloadData];
    self.navigationItem.title = @"Taipei Park Opendata";
    }] resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%@",[parkNameArray objectAtIndex:section]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [parkNameArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[nameArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if(cell ==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    UIImageView* imageImg = (UIImageView *) [cell viewWithTag:1];
    UILabel * parkNameLabel = (UILabel *) [cell viewWithTag:2];
    UILabel * nameLabel = (UILabel *) [cell viewWithTag:3];
    UILabel * introLabel = (UILabel *) [cell viewWithTag:4];
    
    imageImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[[imageArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]]]]];
    parkNameLabel.text = [NSString stringWithFormat:@"%@",[parkNameArray objectAtIndex:indexPath.section]];
    nameLabel.text = [NSString stringWithFormat:@"%@",[[nameArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row ]];
    introLabel.text = [NSString stringWithFormat:@"%@",[[introArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row ]];
    introLabel.lineBreakMode = NSLineBreakByWordWrapping;
    introLabel.numberOfLines = 0;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id ViewController = segue.destinationViewController;
    NSInteger temp_section = self.tableView.indexPathForSelectedRow.section;
    NSInteger temp_row = self.tableView.indexPathForSelectedRow.row;
    [ViewController setValue:[[imageArray objectAtIndex:temp_section] objectAtIndex:temp_row] forKey:@"imageString"];
    [ViewController setValue:[parkNameArray objectAtIndex:temp_section] forKey:@"parkNameString"];
    [ViewController setValue:[[nameArray objectAtIndex:temp_section] objectAtIndex:temp_row] forKey:@"nameString"];
    [ViewController setValue:[[introArray objectAtIndex:temp_section] objectAtIndex:temp_row] forKey:@"introString"];
    [ViewController setValue:[[openTimeArray objectAtIndex:temp_section] objectAtIndex:temp_row] forKey:@"openTimeString"];
    [ViewController setValue:[imageArray objectAtIndex:temp_section] forKey:@"imageArray"];
    [ViewController setValue:[nameArray objectAtIndex:temp_section] forKey:@"nameArray"];
}

@end
