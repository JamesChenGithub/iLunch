//
//  AddressManageTableViewCell.h
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressManageTableViewCell : UITableViewCell
{
    
    UILabel *_title;
    UIImageView *_tipView;
}

@property (nonatomic, readonly) UILabel *title;

@end
