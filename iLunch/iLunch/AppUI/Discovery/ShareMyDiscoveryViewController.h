//
//  ShareMyDiscoveryViewController.h
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface ShareMyDiscoveryViewController : TableRefreshViewController
{
    UITextView *_shareText;
    UITableView *_shareItemInfo;
    UIButton *_shareButton;
}

@end
