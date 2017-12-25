//
//  CBQuoteCell.h
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBQuotation;
@class CBHighlightingTextView;

@interface CBQuoteCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *characterLabel;
@property (weak, nonatomic) IBOutlet UILabel *actAndSceneLabel;
@property (weak, nonatomic) IBOutlet CBHighlightingTextView *quotationTextView;
@property (strong, nonatomic) CBQuotation *quotation;


@end
