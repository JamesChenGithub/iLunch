//
//  ConfirmOrderViewController.h
//  iLunch
//
//  Created by James on 15-1-17.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface ConfirmOrderViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>
{
@protected
    UITableView *_tableView;
    UIButton *_payButton;
    NSMutableArray *_orderItems;
    
}



@end
