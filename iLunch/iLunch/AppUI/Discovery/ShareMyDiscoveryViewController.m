//
//  ShareMyDiscoveryViewController.m
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "ShareMyDiscoveryViewController.h"

@implementation ShareMyDiscoveryViewController

typedef enum
{
    ShareMyDiscoveryCell_FoodName,
    ShareMyDiscoveryCell_ShopName,
    ShareMyDiscoveryCell_Telephone,
    ShareMyDiscoveryCell_Address,
    
    EShareMyDiscoveryCell_Count,
}ShareMyDiscoveryCellType;

- (void)addOwnViews
{
//    _shareText = [[UITextView alloc] init];
//    [self.view addSubview:_shareText];
    
    _shareItemInfo = [[UITableView alloc] init];
    _shareItemInfo.delegate = self;
    _shareItemInfo.dataSource = self;
    [self.view addSubview:_shareItemInfo];
    
    _shareButton = [[UIButton alloc] init];
    [_shareButton setTitle:@"发布" forState:UIControlStateNormal];
    [_shareButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_shareButton setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_shareButton addTarget:self action:@selector(onShareDiscovery) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shareButton];
}

- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    [_shareButton sizeWith:CGSizeMake(bounds.size.width, kBottomButtonHeight)];
    [_shareButton alignParentBottom];
    
    [_shareItemInfo sizeWith:bounds.size];
    [_shareItemInfo scaleToAboveOf:_shareButton];
    
}

- (void)onShareDiscovery
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 120;
    }
    else
    {
        return kDefaultCellHeight;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return section == 0 ? 1 : EShareMyDiscoveryCell_Count;
    
}

#define kShareTextCell @"kShareTextCell"
#define kShareItemCell @"kShareTextCell"

- (NSString *)tipOfIndex:(NSIndexPath *)index
{
//    ShareMyDiscoveryCell_FoodName,
//    ShareMyDiscoveryCell_ShopName,
//    ShareMyDiscoveryCell_Telephone,
//    ShareMyDiscoveryCell_Address,
    switch (index.row)
    {
        case ShareMyDiscoveryCell_FoodName:
            return @"美食名：";
            break;
        case ShareMyDiscoveryCell_ShopName:
            return @"店铺名：";
            break;
        case ShareMyDiscoveryCell_Telephone:
            return @"电话：";
            break;
        case ShareMyDiscoveryCell_Address:
            return @"地址：";
            break;
            
        default:
            return nil;
            break;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kShareTextCell];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kShareTextCell];
            
            _shareText = [[UITextView alloc] init];
            _shareText.font = [UIFont systemFontOfSize:16];
            _shareText.backgroundColor = kAppBakgroundColor;
            [cell.contentView addSubview:_shareText];
            
            _shareText.frame = CGRectMake(kDefaultMargin, kDefaultMargin, self.view.bounds.size.width - 2*kDefaultMargin, 120 - 2*kDefaultMargin);
            _shareText.tag = 1000;
        
        }
        
        
        
        return cell;
    }
    else
    {
        TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kShareItemCell];
        if (!cell)
        {
            NSString *tip = [self tipOfIndex:indexPath];
            
            cell = [[TextFieldTableViewCell alloc] initWith:tip  reuseIdentifier:kShareItemCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        
        return cell;
    }
}

@end
