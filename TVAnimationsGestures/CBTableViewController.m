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
    
    self.tableView.sectionHeaderHeight = 48;
    UINib *sectionHeaderViewNib = [UINib nibWithNibName:@"CBSectionHeaderView" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:sectionHeaderViewNib forCellReuseIdentifier:SectionHeaderViewIdentifier];
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
- (void)sectionHeaderView:(CBSectionHeaderView *)sectionHeaderView sectionOpened:(NSInteger)section {}
- (void)sectionHeaderView:(CBSectionHeaderView *)sectionHeaderView sectionClosed:(NSInteger)section {}

@end
