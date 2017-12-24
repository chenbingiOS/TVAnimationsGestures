//
//  CBSectionHeaderView.h
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBSectionHeaderView;
@protocol SectionHeaderViewDelegate <NSObject>

@optional
- (void)sectionHeaderView:(CBSectionHeaderView *)sectionHeaderView sectionOpened:(NSInteger)section;
- (void)sectionHeaderView:(CBSectionHeaderView *)sectionHeaderView sectionClosed:(NSInteger)section;

@end

@interface CBSectionHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *disclosureButton;
@property (weak, nonatomic) id <SectionHeaderViewDelegate> delegate;
@property (assign, nonatomic) NSInteger section;

- (void)toggleOpenWithUserAction:(BOOL)userAction;

@end
