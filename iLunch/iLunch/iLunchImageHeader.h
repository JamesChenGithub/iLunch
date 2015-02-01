//
//  iLunchImageHeader.h
//  iLunch
//
//  Created by James on 15-1-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#ifndef iLunch_iLunchImageHeader_h
#define iLunch_iLunchImageHeader_h


#define kNav_Back_Icon [UIImage imageNamed:@"topbar_icon_back.png"]

#define kCommonButton_BG_Icon [UIImage imageNamed:@"dock_btn_bg.png"]

// =============================================
#define kTabBarIconSize CGSizeMake(30, 30)
// Tabbar
#define kTabBar_Main_Normal_Icon                 [UIImage imageNamed:@"icon_home00.png"]
#define kTabBar_Main_Select_Icon                 [UIImage imageNamed:@"icon_home01.png"]

#define kTabBar_Discovery_Normal_Icon            [UIImage imageNamed:@"icon_find00.png"]
#define kTabBar_Discovery_Select_Icon            [UIImage imageNamed:@"icon_find01.png"]

#define kTabBar_Mine_Normal_Icon             [UIImage imageNamed:@"icon_user00.png"]
#define kTabBar_Mine_Select_Icon             [UIImage imageNamed:@"icon_user01.png"]

#define kTabBar_Background_Image           nil
//[UIImage imageNamed:@"list_bg.png"]



//==============================================
// 首页
#define kMain_Book_Icon                     [UIImage imageNamed:@"home_icon_book.png"]
#define kMain_Pack_Icon                     [UIImage imageNamed:@"home_icon_pack.png"]


//==============================================
// 我的
#define kMine_Setting_Icon                  [UIImage imageWithColor:[UIColor randomFlatColor] size:CGSizeMake(30, 30)]

//==============================================
// 地址管理
#define kAddressManage_LocateCurrent_Icon       [UIImage imageNamed:@"icon_location.png"]
#define kAddressManage_Cell_Tip_Icon            [UIImage imageNamed:@"btn_more.png"]
#define kAddressManage_AddNewAddress_Tip_Icon   [UIImage imageNamed:@"btn_add00.png"]
#define kAddressManage_AddNewAddress_BG_Icon    kCommonButton_BG_Icon

// 添加新地址
#define kAddressManage_Gender_Uncheck_Icon      [UIImage imageNamed:@"unchecked.png"]
#define kAddressManage_Gender_Checked_Icon      [UIImage imageNamed:@"checked.png"]

#define kAddressManage_Locate_Icon              [UIImage imageNamed:@"btn_).png"]


// 我的--登录
#define kMineLoginView_BG_Icon                  [UIImage imageNamed:@"user_bg.png"]
#define kMineLoginView_UnLogin_Icon             kCommonButton_BG_Icon
#define kMineLoginView_Login_Icon               kCommonButton_BG_Icon
#define kMineLoginView_Setting_Icon             [UIImage imageNamed:@"btn_set.png"]

//我的--午餐提
#define kLunchAlert_TimeEdit_Icon               [UIImage imageNamed:@"icon_edit.png"]
#define kLunchSet_Logo_Icon                     [UIImage imageNamed:@"logo_set.png"]





#endif
