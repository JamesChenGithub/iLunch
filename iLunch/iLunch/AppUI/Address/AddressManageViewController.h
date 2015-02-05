//
//  AddressManageViewController.h
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface AddressManageViewController : TableRefreshViewController
{
    ImageTitleButton *_addNewAddress;
    
    NSMutableArray *_menus;
}

@end
