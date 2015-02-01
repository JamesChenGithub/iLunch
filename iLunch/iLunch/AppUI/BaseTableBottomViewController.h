//
//  BaseTableBottomViewController.h
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableBottomViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>{
@protected
    UITableView *_tableView;
    UIButton *_bottomButton;
}

- (void)addTableView;
- (void)addBottomButton;
- (void)onClickBottom;

@end
