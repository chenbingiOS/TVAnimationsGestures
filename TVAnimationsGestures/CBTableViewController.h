//
//  CBTableViewController.h
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBPlay;
@interface CBTableViewController : UITableViewController

@property (strong, nonatomic) NSArray <CBPlay *> *plays;

@end
