//
//  TableViewController.h
//  KKStream
//
//  Created by Jim Lai on 2017/8/10.
//  Copyright © 2017年 Jim Lai. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewController : UITableViewController
@property (strong,nonatomic) NSMutableArray *parkNameSet;
@property (strong,nonatomic) NSMutableArray *parkNameArray;
@property (strong,nonatomic) NSMutableArray *openTimeArray;
@property (strong,nonatomic) NSMutableArray *nameArray;
@property (strong,nonatomic) NSMutableArray *introArray;
@property (strong,nonatomic) NSMutableArray *imageArray;
@end
