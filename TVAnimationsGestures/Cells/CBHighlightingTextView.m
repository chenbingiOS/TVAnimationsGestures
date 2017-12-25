//
//  CBHighlightingTextView.m
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/25.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import "CBHighlightingTextView.h"

@implementation CBHighlightingTextView

- (void)setHightlightd:(BOOL)hightlightd {
    if (_hightlightd != hightlightd) {
        _hightlightd = hightlightd;
        
        self.textColor = _hightlightd ? [UIColor whiteColor] : [UIColor blackColor];        
    }
    return;
}

@end
