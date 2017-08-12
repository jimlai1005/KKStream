//
//  ViewController.h
//  KKStream
//
//  Created by Jim Lai on 2017/8/10.
//  Copyright © 2017年 Jim Lai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong) NSString *imageString;
@property (strong) NSString *parkNameString;
@property (strong) NSString *nameString;
@property (strong) NSString *introString;
@property (strong) NSString *openTimeString;
@property (strong) NSMutableArray *imageArray;
@property (strong) NSMutableArray *nameArray;
@property (strong) NSMutableArray *imageArray2;
@property (strong) NSMutableArray *nameArray2;
@property (strong) UIScrollView *bannerScrollView;
@property (strong) UIImageView *bannerImage1Img;
@property (strong) UIImageView *bannerImage2Img;
@property (strong) UIImageView *bannerImage3Img;
@property (strong) UIImageView *bannerImage4Img;
@property (strong) UILabel * bannerName1Label;
@property (strong) UILabel * bannerName2Label;
@property (strong) UILabel * bannerName3Label;
@property (strong) UILabel * bannerName4Label;

typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionUnknow,
    ScrollDirectionLeft,
    ScrollDirectionRight
};
@property (nonatomic, assign) ScrollDirection scrollDirection;


@end

