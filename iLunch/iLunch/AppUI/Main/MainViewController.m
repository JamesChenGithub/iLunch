//
//  MainViewController.m
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = kMain_Title_Str;
}

- (void)addBackItem
{
    
}

- (void)addOwnViews
{
    _book = [[ImageTitleButton alloc] initWithStyle:EImageTopTitleBottom];
    _book.imageSize = CGSizeMake(100, 100);
    [_book setImage:kMain_Book_Icon forState:UIControlStateNormal];
    [_book setTitle:kMain_Book_Str forState:UIControlStateNormal];
    [_book setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [_book addTarget:self action:@selector(onBook:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_book];
    
    _pack = [[ImageTitleButton alloc] initWithStyle:EImageTopTitleBottom];
    _pack.imageSize = CGSizeMake(100, 100);
    [_pack setImage:kMain_Pack_Icon forState:UIControlStateNormal];
    [_pack setTitle:kMain_Pack_Str forState:UIControlStateNormal];
    [_pack setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [_pack addTarget:self action:@selector(onPack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pack];
    
}

- (void)layoutOnIPhone
{
    [_book sizeWith:CGSizeMake(160, 140)];
    [_book layoutParentHorizontalCenter];
    [_book alignParentTopWithMargin:35];
    
    [_pack sameWith:_book];
    [_pack layoutBelow:_book margin:30];
}


- (void)onBook:(ImageTitleButton *)book
{    
    MainBookViewController *bv = [NSObject loadClass:[MainBookViewController class]];
    bv.title = [book titleForState:UIControlStateNormal];
    [[AppDelegate sharedAppDelegate] pushViewController:bv];
}


- (void)onPack:(ImageTitleButton *)pack
{
    MainPackViewController *pv = [NSObject loadClass:[MainPackViewController class]];
    pv.title = [pack titleForState:UIControlStateNormal];
    [[AppDelegate sharedAppDelegate] pushViewController:pv];
}





@end
