//
//  AppDelegate.m
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/22.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import "AppDelegate.h"
// Model
#import "CBPlay.h"
#import "CBQuotation.h"
// VC
#import "CBTableViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray *plays;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    CBTableViewController *tableViewController = (CBTableViewController *)navigationController.topViewController;
    tableViewController.plays = self.plays;
    
    return YES;
}

- (NSMutableArray *)plays {
    if (_plays == nil) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"PlaysAndQuotations" withExtension:@"plist"];
        NSArray *playDictionariesArray = [NSArray arrayWithContentsOfURL:url];
        _plays = [NSMutableArray arrayWithCapacity:playDictionariesArray.count];
        
        for (NSDictionary *playDictionary in playDictionariesArray) {
            CBPlay *play = [CBPlay new];
            play.playName = playDictionary[@"playName"];
            
            NSArray *quotationDictionaries = playDictionary[@"quotations"];
            NSMutableArray *quotations = [NSMutableArray arrayWithCapacity:quotationDictionaries.count];
            for (NSDictionary *quotationDictionary in quotationDictionaries) {
                CBQuotation *quotation = [CBQuotation new];
                [quotation setValuesForKeysWithDictionary:quotationDictionary];
                [quotations addObject:quotation];
            }
            
            play.quotations = quotations;
            
            [_plays addObject:play];
        }
    }
    return _plays;
}

@end
