//
//  ViewController.m
//  KKStream
//
//  Created by Jim Lai on 2017/8/10.
//  Copyright © 2017年 Jim Lai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize imageString;
@synthesize parkNameString;
@synthesize nameString;
@synthesize introString;
@synthesize openTimeString;
@synthesize imageArray;
@synthesize nameArray;
@synthesize imageArray2;
@synthesize nameArray2;
@synthesize bannerImage1Img;
@synthesize bannerImage2Img;
@synthesize bannerImage3Img;
@synthesize bannerImage4Img;
@synthesize bannerImage5Img;
@synthesize bannerImage6Img;
@synthesize bannerName1Label;
@synthesize bannerName2Label;
@synthesize bannerName3Label;
@synthesize bannerName4Label;
@synthesize bannerName5Label;
@synthesize bannerName6Label;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView* imageImg = (UIImageView *) [self.view viewWithTag:1];
    UILabel * parkNameLabel = (UILabel *) [self.view viewWithTag:2];
    UILabel * nameLabel = (UILabel *) [self.view viewWithTag:3];
    UITextView * introTextView = (UITextView *) [self.view viewWithTag:4];
    UILabel * openTimeLabel = (UILabel *) [self.view viewWithTag:5];
    
    imageImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageString]]];
    parkNameLabel.text = [NSString stringWithFormat:@"%@",parkNameString];
    nameLabel.text = [NSString stringWithFormat:@"%@",nameString];
    introTextView.text = [NSString stringWithFormat:@"%@",introString];
    introTextView.editable = NO;
    openTimeLabel.text = [NSString stringWithFormat:@"%@",openTimeString];
    self.navigationItem.title = [NSString stringWithFormat:@"%@",nameString];

    imageArray2 = [[NSMutableArray alloc]initWithArray:imageArray];
    nameArray2 = [[NSMutableArray alloc]initWithArray:nameArray];
    [imageArray2 removeObject:imageString];
    [nameArray2 removeObject:nameString];
    
    bannerImage1Img = [self.view viewWithTag:7];
    bannerImage2Img = [self.view viewWithTag:8];
    bannerImage3Img = [self.view viewWithTag:9];
    bannerImage4Img = [self.view viewWithTag:10];
    bannerImage5Img = [self.view viewWithTag:11];
    bannerImage6Img = [self.view viewWithTag:12];
    bannerName1Label = [self.view viewWithTag:13];
    bannerName2Label = [self.view viewWithTag:14];
    bannerName3Label = [self.view viewWithTag:15];
    bannerName4Label = [self.view viewWithTag:16];
    bannerName5Label = [self.view viewWithTag:17];
    bannerName6Label = [self.view viewWithTag:18];
    
    switch([imageArray2 count])
    {
        case 0:
            break;
        case 1:
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:0]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:0]];
            break;
        case 2:
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:0]]]]];
            bannerImage2Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:1]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:0]];
            bannerName2Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:1]];
            break;
        case 3:
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:0]]]]];
            bannerImage2Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:1]]]]];
            bannerImage3Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:2]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:0]];
            bannerName2Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:1]];
            bannerName3Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:2]];
            break;
        case 4:
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:0]]]]];
            bannerImage2Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:1]]]]];
            bannerImage3Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:2]]]]];
            bannerImage4Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:3]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:0]];
            bannerName2Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:1]];
            bannerName3Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:2]];
            bannerName4Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:3]];
            break;
        case 5:
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:0]]]]];
            bannerImage2Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:1]]]]];
            bannerImage3Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:2]]]]];
            bannerImage4Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:3]]]]];
            bannerImage5Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:4]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:0]];
            bannerName2Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:1]];
            bannerName3Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:2]];
            bannerName4Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:3]];
            bannerName5Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:4]];
            break;
        default:
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:0]]]]];
            bannerImage2Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:1]]]]];
            bannerImage3Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:2]]]]];
            bannerImage4Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:3]]]]];
            bannerImage5Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:4]]]]];
            bannerImage6Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:5]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:0]];
            bannerName2Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:1]];
            bannerName3Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:2]];
            bannerName4Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:3]];
            bannerName5Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:4]];
            bannerName6Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:5]];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
