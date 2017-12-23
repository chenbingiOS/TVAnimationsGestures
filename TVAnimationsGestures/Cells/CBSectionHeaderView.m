

//
//  CBSectionHeaderView.m
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import "CBSectionHeaderView.h"

@implementation CBSectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
    [self addGestureRecognizer:tapGesture];
}

- (IBAction)toggleOpen:(id)sender {
    [self toggleOpenWithUserAction:YES];
};

- (void)toggleOpenWithUserAction:(BOOL)userAction {
    
    self.disclosureButton.selected = !self.disclosureButton.selected;
    
    if (userAction) {
        if (self.disclosureButton.selected) {
            [self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)];
            [self.delegate sectionHeaderView:self sectionOpened:self.section];
        } else {
            [self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)];
            [self.delegate sectionHeaderView:self sectionClosed:self.section];
        }
    }
}

@end
