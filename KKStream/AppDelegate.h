//
//  AppDelegate.h
//  KKStream
//
//  Created by Jim Lai on 2017/8/10.
//  Copyright © 2017年 Jim Lai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

