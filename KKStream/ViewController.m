//
//  ViewController.m
//  KKStream
//
//  Created by Jim Lai on 2017/8/10.
//  Copyright © 2017年 Jim Lai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger _currentPage;
}
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
@synthesize bannerScrollView;
@synthesize bannerImage1Img;
@synthesize bannerImage2Img;
@synthesize bannerImage3Img;
@synthesize bannerImage4Img;
@synthesize bannerName1Label;
@synthesize bannerName2Label;
@synthesize bannerName3Label;
@synthesize bannerName4Label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView* imageImg = (UIImageView *) [self.view viewWithTag:1];
    UILabel * parkNameLabel = (UILabel *) [self.view viewWithTag:2];
    UILabel * nameLabel = (UILabel *) [self.view viewWithTag:3];
    UILabel * introLabel = (UILabel *) [self.view viewWithTag:4];
    UILabel * openTimeLabel = (UILabel *) [self.view viewWithTag:5];
    
    imageImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageString]]];
    parkNameLabel.text = [NSString stringWithFormat:@"%@",parkNameString];
    nameLabel.text = [NSString stringWithFormat:@"%@",nameString];
    introLabel.text = [NSString stringWithFormat:@"%@",introString];
    openTimeLabel.text = [NSString stringWithFormat:@"%@",openTimeString];
    
    parkNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    parkNameLabel.numberOfLines = 0;
    nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    nameLabel.numberOfLines = 0;
    introLabel.lineBreakMode = NSLineBreakByWordWrapping;
    introLabel.numberOfLines = 0;
    openTimeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    openTimeLabel.numberOfLines = 0;
    
    NSLog(@"%@",imageString);
    NSLog(@"%@",parkNameString);
    NSLog(@"%@",nameString);
    NSLog(@"%@",openTimeString);
    
    
    imageArray2 = [[NSMutableArray alloc]initWithArray:imageArray];
    nameArray2 = [[NSMutableArray alloc]initWithArray:nameArray];
    [imageArray2 removeObject:imageString];
    [nameArray2 removeObject:nameString];
    
    bannerScrollView = [self.view viewWithTag:6];
    //bannerScrollView.contentSize = CGSizeMake(MAXFLOAT, 0);
    //bannerScrollView.backgroundColor = [UIColor orangeColor];
    [bannerScrollView setDelegate:self];
    [bannerScrollView setScrollEnabled:YES];
    [bannerScrollView setShowsVerticalScrollIndicator:YES];
    [bannerScrollView setShowsHorizontalScrollIndicator:YES];
    [bannerScrollView setAutoresizesSubviews:NO];
    
    bannerImage1Img = [self.view viewWithTag:7];
    bannerImage2Img = [self.view viewWithTag:8];
    bannerImage3Img = [self.view viewWithTag:9];
    bannerImage4Img = [self.view viewWithTag:10];
    bannerName1Label = [self.view viewWithTag:11];
    bannerName2Label = [self.view viewWithTag:12];
    bannerName3Label = [self.view viewWithTag:13];
    bannerName4Label = [self.view viewWithTag:14];
    
    switch([imageArray count])
    {
        case 0:
            //
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
            
        default:
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:0]]]]];
            bannerImage2Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:1]]]]];
            bannerImage3Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:2]]]]];
            bannerImage4Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:3]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:0]];
            bannerName2Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:1]];
            bannerName3Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:2]];
            bannerName4Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:3]];
            break;
    }
    _currentPage=0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    /** 判断一下此时是向右滚动还是向左滚动，根据设想，停止时的scrollView显示的内容永远是中间，那么scrollView.contentOffset.x 静止时应该是 scrollView.frame.size.width，这里就是SCREEN_WIDTH这个宏。那么在滚动的时候通过scrollView.contentOffset.x 就可以知道是向哪个方向滚动
     */
    CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    
    if (scrollView.contentOffset.x > SCREEN_WIDTH)
    {
        if (_scrollDirection == ScrollDirectionUnknow || _scrollDirection == ScrollDirectionLeft)
        {
            NSLog(@"向右滚动");
            if ([imageArray2 count] >=3)
            {
                // 向右滚动则要把另一张图片放在右边
                bannerImage4Img.frame = CGRectMake(bannerImage3Img.frame.origin.x + 104 + 20, 0, 104, 53);
                bannerName4Label.frame = CGRectMake(bannerName3Label.frame.origin.x + 104 + 20, 0, 104, 21);

                // 同时给这个imageView上图片
                if (_currentPage+2 == [imageArray2 count] - 1)
                {
                    bannerImage4Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:0]]]]];
                    bannerName4Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:0]];
                }
                else
                {
                    bannerImage4Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:_currentPage + 1]]]]];
                    bannerName4Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:_currentPage + 1]];
                }
            
                // 设定方向（用来性能优化的点）
                _scrollDirection = ScrollDirectionRight;
            }
        }
    }
    else if (scrollView.contentOffset.x < SCREEN_WIDTH)
    {
        if (_scrollDirection == ScrollDirectionUnknow || _scrollDirection == ScrollDirectionRight)
        {
            NSLog(@"向左滚动");
            if ([imageArray2 count] >=3)
            {
                // 同理向左
                bannerImage4Img.frame = CGRectMake(bannerImage1Img.frame.origin.x - 104 - 20, 0, 104, 53);
                bannerName4Label.frame = CGRectMake(bannerName3Label.frame.origin.x + 104 + 20, 0, 104, 21);

                if (_currentPage == 0)
                {
                    bannerImage4Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:[imageArray2 count] - 1]]]]];
                    bannerName4Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:[nameArray2 count] - 1]];

                }
                else
                {
                    bannerImage4Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:_currentPage - 1]]]]];
                    bannerName4Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:_currentPage - 1]];

                }
                // 设定方向（用来性能优化的点）
                _scrollDirection = ScrollDirectionLeft;
            }
        }
    }
    else
    {
        _scrollDirection = ScrollDirectionUnknow;
    }
    
    // 重置图像，就是把otherImageView拉到中间全部显示的时候，赶紧换currentImageView来显示，即把scrollView.contentOffset.x 又设置到原来的位置，那么_currentImageView又能够全部显示了，但是_currentImageView显示的上一张/下一张的图片，需要替换成当前图片。进入该判断次数不多
    if ([imageArray2 count] >=3)
    {
        if (scrollView.contentOffset.x >= SCREEN_WIDTH + (104+20))
        {
            NSLog(@"向右越界");
            if (_currentPage+2 == [imageArray2 count])
            {
                _currentPage = 0;
            }
            else
            {
                _currentPage++;
            }
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:_currentPage]]]]];
            bannerImage2Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:_currentPage+1]]]]];
            bannerImage3Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:_currentPage+2]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:_currentPage]];
            bannerName2Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:_currentPage+1]];
            bannerName3Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:_currentPage+2]];
            scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        
        }
        else if (scrollView.contentOffset.x <= SCREEN_WIDTH - (104+20))
        {
            NSLog(@"向左越界");
            if (_currentPage == 0)
            {
                _currentPage = [imageArray2 count]-3;
            }
            else
            {
                _currentPage--;
            }
            bannerImage1Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:_currentPage]]]]];
            bannerImage2Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:_currentPage+1]]]]];
            bannerImage3Img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [imageArray2 objectAtIndex:_currentPage+2]]]]];
            bannerName1Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:_currentPage]];
            bannerName2Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:_currentPage+1]];
            bannerName3Label.text = [NSString stringWithFormat:@"%@", [nameArray2 objectAtIndex:_currentPage+2]];
            scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
