//
//  CBSectionInfo.m
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import "CBSectionInfo.h"

@implementation CBSectionInfo

- (instancetype)init {
    self = [super init];
    if (self) {
        _rowHeights = [NSMutableArray array];
    }
    return self;
}

- (NSUInteger)countOfRowHeights {
    return self.rowHeights.count;
}

- (id)objectInRowHeightsAtIndex:(NSUInteger)idx {
    return [self.rowHeights objectAtIndex:idx];
}

- (void)insertObject:(id)anObject inRowHeightsAtIndex:(NSUInteger)idx {
    return [self.rowHeights insertObject:anObject atIndex:idx];
}

- (void)removeObjectFromRowHeightsAtIndex:(NSUInteger)idx {
    return [self.rowHeights removeObjectAtIndex:idx];
}

- (void)replaceObjectInRowHeightsAtIndex:(NSUInteger)idx withObject:(id)anObject {
    return [self.rowHeights replaceObjectAtIndex:idx withObject:anObject];
}

- (void)insertRowHeights:(NSArray *)rowHeightArray atIndexes:(NSIndexSet *)indexes {
    return [self.rowHeights insertObjects:rowHeightArray atIndexes:indexes];
}

- (void)removeRowHeightsAtIndexes:(NSIndexSet *)indexes {
    return [self.rowHeights removeObjectsAtIndexes:indexes];
}

- (void)replaceRowHeightsAtIndexes:(NSIndexSet *)indexes withRowHeights:(NSArray *)rowHeightArray {
    return [self.rowHeights replaceObjectsAtIndexes:indexes withObjects:rowHeightArray];
}


@end
