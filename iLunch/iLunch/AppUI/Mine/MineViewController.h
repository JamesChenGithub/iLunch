//
//  MineViewController.h
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface MineViewController : TableRefreshViewController
{
@protected
    
    NSMutableArray *_menus;
}

@property (nonatomic, strong) NSMutableArray *menus;

@end
