//
//  MyLocationViewController.h
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

typedef void (^AddressHandler)(CityItem *address);

@interface MyLocationViewController : TableRefreshViewController
{
    
    ScrollIndexView *_header;
    
    
    UIButton *_saveAddress;
}

@property (nonatomic, copy) AddressHandler addressCompletion;

@end
