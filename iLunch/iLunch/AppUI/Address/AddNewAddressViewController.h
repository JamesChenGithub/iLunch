//
//  AddNewAddressViewController.h
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

typedef enum
{
    EAddNewAddressViewCell_Contact,
    EAddNewAddressViewCell_Gender,
    EAddNewAddressViewCell_PhoneNum,
    EAddNewAddressViewCell_Location,
    EAddNewAddressViewCell_DetailAddress,

    EAddNewAddressViewCell_Count
    
}AddNewAddressViewCellStyle;


@interface AddNewAddressViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    UIButton *_saveAddress;
}


@end
