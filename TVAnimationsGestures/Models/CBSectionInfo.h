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
@property (strong, nonatomic) NSMutableArray *rowHeights;

- (NSUInteger)countOfRowHeights;
- (id)objectInRowHeightsAtIndex:(NSUInteger)idx;
- (void)insertObject:(id)anObject inRowHeightsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromRowHeightsAtIndex:(NSUInteger)idx;
- (void)replaceObjectInRowHeightsAtIndex:(NSUInteger)idx withObject:(id)anObject;
- (void)insertRowHeights:(NSArray *)rowHeightArray atIndexes:(NSIndexSet *)indexes;
- (void)removeRowHeightsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceRowHeightsAtIndexes:(NSIndexSet *)indexes withRowHeights:(NSArray *)rowHeightArray;

@end
