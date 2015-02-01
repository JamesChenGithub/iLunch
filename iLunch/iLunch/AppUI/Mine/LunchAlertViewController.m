//
//  LunchAlertViewController.m
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "LunchAlertViewController.h"

@interface LunchAlertViewController ()

@property (nonatomic, strong) NSMutableArray *menus;

@end

@implementation LunchAlertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
}

- (void)addFootView
{
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"周一到周五每天%@提醒吃午饭。", [AppSetting shareInstance].lunchTime];
    label.textColor = kDetailTextColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    label.frame = CGRectMake(0, 0, self.view.bounds.size.width, kDefaultCellHeight/2);
    _tableView.tableFooterView = label;
}



- (void)configOwnViews
{
    self.menus = [NSMutableArray array];
    
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"午餐提醒" icon:nil action:nil];
    [_menus addObject:item];
    
    if ([AppSetting shareInstance].isAlertLunch)
    {
        [self addCurrentTime];
        [self addFootView];
    }
    else
    {
        _tableView.tableFooterView = nil;
    }
    
    
}

- (void)addCurrentTime
{
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"当前时间：" icon:nil action:nil];
    [_menus addObject:item];
    
    [self addFootView];
}


- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    
    if ([AppSetting  shareInstance].isAlertLunch)
    {
        _tableView.frame = CGRectMake(0, 0, bounds.size.width, kDefaultCellHeight * (self.menus.count + 1));
    }
    else
    {
        _tableView.frame = CGRectMake(0, 0, bounds.size.width, kDefaultCellHeight * self.menus.count);
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kDefaultCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menus.count;
}

#define kLunchAlertCellType_Alert @"ELunchAlertCellType_Alert"
#define kLunchAlertCellType_CurrentTime @"ELunchAlertCellType_CurrentTime"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == ELunchAlertCellType_Alert)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLunchAlertCellType_Alert];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kLunchAlertCellType_Alert];
            cell.textLabel.textColor = kMainTextColor;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            UISwitch *us = [[UISwitch alloc] init];
            us.tag = 1000;
            [us addTarget:self action:@selector(onSettingAlertLunch:) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:us];
        }
        
        MenuItem *item = self.menus[indexPath.row];
        cell.textLabel.text = item.title;
        
        UISwitch *us = (UISwitch *)[cell.contentView viewWithTag:1000];
        [us layoutParentVerticalCenter];
        [us alignParentRightWithMargin:20];
        us.on = [AppSetting shareInstance].isAlertLunch;
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLunchAlertCellType_CurrentTime];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kLunchAlertCellType_CurrentTime];
            cell.textLabel.textColor = kMainTextColor;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            _setLunchTime = [[ImageTitleButton alloc] initWithStyle:ETitleLeftImageRightCenter];
            UIImage *img = kLunchAlert_TimeEdit_Icon;
            _setLunchTime.imageSize = img.size;
            [_setLunchTime setTitleColor:kMainTextColor forState:UIControlStateNormal];
            [_setLunchTime.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [_setLunchTime setImage:img forState:UIControlStateNormal];
            [_setLunchTime addTarget:self action:@selector(onSetLunchTime:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:_setLunchTime];
            
            _setLunchTime.tag = 2000;
        }
        
        MenuItem *item = self.menus[indexPath.row];
        cell.textLabel.text = item.title;
        
        _setLunchTime.bounds = CGRectMake(0, 0, 75, 40);
        [_setLunchTime layoutParentVerticalCenter];
        [_setLunchTime alignParentRightWithMargin:20];
        
        [_setLunchTime setTitle:[AppSetting shareInstance].lunchTime forState:UIControlStateNormal];

        return cell;
    }
}


- (void)onSettingAlertLunch:(UISwitch *)us
{
    [AppSetting shareInstance].isAlertLunch = us.on;
    [self reload];
}

- (void)reload
{
    [self configOwnViews];
    [self layoutSubviewsFrame];
    [_tableView reloadData];
}

- (void)onSetLunchTime:(ImageTitleButton *)btn
{
    LunchTimeSettingView *lun = [[LunchTimeSettingView alloc] initActionSheetStyle];
    
    __weak typeof(self) ws = self;
    lun.doneAction = ^(id lun) {
        [ws reload];
    };
    
    [lun setFrameAndLayout:self.view.bounds];
    [self.view addSubview:lun];
    [lun slideIn];
}
@end
