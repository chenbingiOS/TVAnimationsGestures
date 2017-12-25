//
//  CBQuoteCell.m
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import "CBQuoteCell.h"
#import "CBQuotation.h"
#import "CBHighlightingTextView.h"

@implementation CBQuoteCell

- (void)setQuotation:(CBQuotation *)quotation {
    if (_quotation != quotation) {
        _quotation = quotation;
        
        self.characterLabel.text = _quotation.character;
        self.actAndSceneLabel.text = [NSString stringWithFormat:@"Act %@, Scene %@", @(_quotation.act), @(_quotation.scene)];
        self.quotationTextView.text = _quotation.quotation;
    }
}

@end
