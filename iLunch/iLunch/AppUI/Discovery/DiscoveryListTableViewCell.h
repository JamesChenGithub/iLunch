//
//  DiscoveryListTableViewCell.h
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoveryListTableViewCell : UITableViewCell
{
    UIView *_panel;
    
    UIImageView *_userIcon;
    UILabel     *_userName;
    UILabel     *_hourAgo;
    
    UILabel     *_share;
    
    UIImageView *_line;
    UILabel     *_shopName;
    ImageTitleButton *_shopAddress;
    ImageTitleButton *_shopContact;
}

+ (CGFloat)heightOf:(NSString *)share;

- (void)configWith:(NSString *)text;

@end
