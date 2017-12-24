//
//  CBTableViewController.m
//  TVAnimationsGestures
//
//  Created by 陈冰 on 2017/12/23.
//  Copyright © 2017年 ChenBing. All rights reserved.
//

#import "CBTableViewController.h"
// Model
#import "CBSectionInfo.h"
#import "CBPlay.h"
// View
#import "CBQuoteCell.h"
#import "CBSectionHeaderView.h"

static NSString *SectionHeaderViewIdentifier = @"SectionHeaderViewIdentifier";
static NSString *QuoteCellIdentifier = @"QuoteCellIdentifier";

@interface CBTableViewController () <SectionHeaderViewDelegate>

@property (strong, nonatomic) NSMutableArray *sectionInfoArray;
@property (assign, nonatomic) NSInteger openSectionIndex;

@end

@implementation CBTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.sectionInfoArray == nil || self.sectionInfoArray.count != [self numberOfSectionsInTableView:self.tableView]) {
        
        NSMutableArray *infoArray = [NSMutableArray new];
        for (CBPlay *play in self.plays) {
            
            CBSectionInfo *sectionInfo = [CBSectionInfo new];
            sectionInfo.play = play;
            sectionInfo.open = NO;
            
            [infoArray addObject:sectionInfo];
        }
        
        self.sectionInfoArray = infoArray;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.openSectionIndex = NSNotFound;
    
    self.tableView.sectionHeaderHeight = 48;
    UINib *sectionHeaderViewNib = [UINib nibWithNibName:@"CBSectionHeaderView" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:sectionHeaderViewNib forHeaderFooterViewReuseIdentifier:SectionHeaderViewIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.plays.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CBSectionInfo *sectionInfo = self.sectionInfoArray[section];
    NSInteger countOfQuotationInSection = sectionInfo.play.quotations.count;
    return sectionInfo.open ? countOfQuotationInSection : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CBQuoteCell *cell = [tableView dequeueReusableCellWithIdentifier:QuoteCellIdentifier];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CBSectionHeaderView *sectionHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionHeaderViewIdentifier];
    
    CBSectionInfo *sectionInfo = self.sectionInfoArray[section];
    sectionInfo.sectionHeaderView = sectionHeaderView;
    
    sectionHeaderView.titleLabel.text = sectionInfo.play.playName;
    sectionHeaderView.section = section;
    sectionHeaderView.delegate = self;
    
    return sectionHeaderView;    
}

#pragma mark - SectionHeaderViewDelegate
- (void)sectionHeaderView:(CBSectionHeaderView *)sectionHeaderView sectionOpened:(NSInteger)section {
    CBSectionInfo *sectionInfo = self.sectionInfoArray[section];
    sectionInfo.open = YES;
    
    // 需要展开的cell
    NSUInteger countOfRowsInSection = sectionInfo.play.quotations.count;
    NSMutableArray *indexPathsToInsert = [NSMutableArray new];
    for (NSUInteger i = 0; i < countOfRowsInSection; i++) {
        [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    
    // 把其他的cell隐藏
    NSMutableArray *indexPathsToDelete = [NSMutableArray new];
    NSInteger previousOpenSectionIndex = self.openSectionIndex;
    if (previousOpenSectionIndex != NSNotFound) {
        
        CBSectionInfo *previousSectionInfo = self.sectionInfoArray[previousOpenSectionIndex];
        previousSectionInfo.open = NO;
        [previousSectionInfo.sectionHeaderView toggleOpenWithUserAction:NO]; // 改变按钮UI
        
        NSUInteger countOfRowsToDelete = previousSectionInfo.play.quotations.count;
        for (NSUInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
        }
    }
    
    
    // 切换动画 如果是默认第一个，这第一个从上到下展开，如果是新一个，则前一个从下往上收起
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenSectionIndex == NSNotFound || section < previousOpenSectionIndex) {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    } else {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    // 表格动画效果，多动作同时
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.tableView endUpdates];
    
    self.openSectionIndex = section;
}

- (void)sectionHeaderView:(CBSectionHeaderView *)sectionHeaderView sectionClosed:(NSInteger)section {
    CBSectionInfo *sectionInfo = self.sectionInfoArray[section];
    sectionInfo.open = NO;
    
    // 需要隐藏的cell
    NSUInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:section];
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [NSMutableArray new];
        for (NSUInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
 
    self.openSectionIndex = NSNotFound;
}

@end
