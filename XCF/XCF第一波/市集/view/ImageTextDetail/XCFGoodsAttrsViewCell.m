//
//  XCFGoodsAttrsViewCell.m
//  XCF第一波
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGoodsAttrsViewCell.h"
#import "XCFGoodsAttrs.h"
#import "XCFAttrsCell.h"

@implementation XCFGoodsAttrsViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = XCFGlobalBackgroundColor;
        
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = XCFGlobalBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[XCFAttrsCell class] forCellReuseIdentifier:@"attrsCell"];
        
        [self.contentView addSubview:_tableView];
        
//        _tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    }
    return self;
}




#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.attrsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XCFAttrsCell *attrsCell = [tableView dequeueReusableCellWithIdentifier:@"attrsCell"];
    if (!attrsCell) {
        attrsCell = [[XCFAttrsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"attrsCell"];
    }
    
    if (self.attrsArray.count) {
        
   attrsCell.attrs = self.attrsArray[indexPath.row];
        
    }
    return attrsCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 30;
}

- (void)setAttrsArray:(NSArray *)attrsArray {
    _attrsArray = attrsArray;
   
    
    [self.tableView reloadData];
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
   
    
    if (scrollView.contentOffset.y < -100){
        !self.viewWillDismissBlock ? : self.viewWillDismissBlock();
    }
}


@end
