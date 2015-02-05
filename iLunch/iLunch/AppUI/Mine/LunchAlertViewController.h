//
//  LunchAlertViewController.h
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

typedef enum {
    ELunchAlertCellType_Alert,
    ELunchAlertCellType_CurrentTime,
}LunchAlertCellType;

@interface LunchAlertViewController : TableRefreshViewController
{
    ImageTitleButton *_setLunchTime;
    NSMutableArray *_menus;
}



@end
