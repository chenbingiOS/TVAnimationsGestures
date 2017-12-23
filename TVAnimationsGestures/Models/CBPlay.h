//
//  CBPlay.h
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBQuotation;
@interface CBPlay : NSObject

@property (copy, nonatomic) NSString *playName;
@property (strong, nonatomic) NSArray <CBQuotation *> *quotations;

@end
