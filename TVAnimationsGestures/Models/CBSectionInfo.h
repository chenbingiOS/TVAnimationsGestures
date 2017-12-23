//
//  CBSectionInfo.h
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBPlay;
@class CBSectionHeaderView;
@interface CBSectionInfo : NSObject

@property (strong, nonatomic) CBPlay *play;
@property (strong, nonatomic) CBSectionHeaderView *sectionHeaderView;
@property (assign, nonatomic, getter=isOpen) BOOL open;

@end
