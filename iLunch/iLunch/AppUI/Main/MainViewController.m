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
//    {"Head":{"Version":"1","MachineType":"0","UserCode":"awc","Password":"123456"},"Body":{"UserId":"13","UserName":"测试用户","TogoId":"811","Comment":"不错哦！","Attitude":"5","Quality":"5","Speed":"5"}}
//    AddComment *ac = [[AddComment alloc] initWithHandler:^(BaseRequest *request) {
//        
//    }];
//    ac.UserId = 13;
//    ac.UserName = @"测试用户";
//    ac.TogoId = 811;
//    ac.Comment = @"这只是一个测试，不要当填";
//    ac.Attitude = 5;
//    ac.Quality = 5;
//    ac.Speed = 5;
//    [[WebServiceEngine sharedEngine] asyncRequest:ac];
//    return;
    
////    {"Head":{"Version":"1","MachineType":"0","UserCode":"awc","Password":"123456"},"Body":{"UserId":"13","TogoId":"811","Page":"1"}}
//    GetComment *comment = [[GetComment alloc] initWithHandler:^(BaseRequest *request) {
//        
//    }];
//    comment.UserId = 13;
//    comment.TogoId = 811;
//    comment.Page = 1;
//    [[WebServiceEngine sharedEngine] asyncRequest:comment];
//
//    return;
    
    
//    008160203233632010
//    {"Head":{"Version":"1","MachineType":"0","UserCode":"awc","Password":"123456"},"Body":{"OrderId":"008160127160307350","PayMode":"4","PayState":"1"}}
    
//    // 未调通
//    UpdateOrder *uo = [[UpdateOrder alloc] initWithHandler:^(BaseRequest *request) {
//        
//    }];
//    uo.OrderId = @"008160203233632010";
//    uo.PayMode = 4;
//    uo.PayState = 1;
//    [[WebServiceEngine sharedEngine] asyncRequest:uo];
//    return;

    
//    //    {"Head":{"Version":"1","MachineType":"0","UserCode":"awc","Password":"123456"},"Body":{"UCode":"458f8bb0-ac9b-4e64-a54d-abfeecaf4088","UserId":"13","Address":"测试地址","AddressID":"50","Remark":"少盐","SendTime":"12:00","OrderType":2}}
//    
//    SubmitOrder *order = [[SubmitOrder alloc] initWithHandler:^(BaseRequest *request) {
//        
//    }];
//    order.UCode = @"458f8bb0-ac9b-4e64-a54d-abfeecaf4088";
//    order.UserId = 13;
//    order.Address = @"测试地址";
//    order.AddressID = 50;
//    order.Remark = @"少盐";
//    order.SendTime = @"12:00";
//    order.OrderType = 2;
//    [[WebServiceEngine sharedEngine] asyncRequest:order];
//    return;
    
    //    GetSTemplateListItem
    //    GetSTemplateList *gtl = [[GetSTemplateList alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    [[WebServiceEngine sharedEngine] asyncRequest:gtl];
    //    return;
    
//         没有调通
        GetMyAddress *gma = [[GetMyAddress alloc] initWithHandler:^(BaseRequest *request) {
    
        }];
        gma.UserId = 13;
    gma.PageIndex = 1;
    gma.PageSize = 5;
    
        [[WebServiceEngine sharedEngine] asyncRequest:gma];
        return;
    
    //    GetCartList *gcl = [[GetCartList alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    gcl.UCode = @"458f8bb0-ac9b-4e64-a54d-abfeecaf4088";
    //    [[WebServiceEngine sharedEngine] asyncRequest:gcl];
    //    return;
    
    
    
    
    //    "UCode": "458f8bb0-ac9b-4e64-a54d-abfeecaf4088",
    //    "UserId": "13",
    //    "TogoId": "816",
    //    "TogoName": "测试商家",
    //    "UnId": "949",
    //    "PName": "酸辣鸡杂",
    //    "PPrice": "15",
    //    "PNum": "1",
    //    "TullPrice": "15"
    
    //    AddToCart *atc = [[AddToCart alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    atc.isAddNew = NO;
    //    atc.UCode = @"458f8bb0-ac9b-4e64-a54d-abfeecaf4088";
    //    atc.UserId = 13;
    //    atc.TogoId = 816;
    //    atc.TogoName = @"测试商家";
    //    atc.UnId = 949;
    //    atc.PName = @"酸辣鸡杂";
    //    atc.PPrice = @"15";
    //    atc.PNum = 1;
    //    atc.TullPrice = @"15";
    //    [[WebServiceEngine sharedEngine] asyncRequest:atc];
    //    return;
    
    
    
    //    GetFoodImg *gfi = [[GetFoodImg alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    gfi.ImgUrl = @"~/upload/201408/w201408301103396942.gif";
    //    gfi.Width = 400;
    //    [[WebServiceEngine sharedEngine] asyncRequest:gfi];
    //    return;
    
    //    CheckIsCollect *cic = [[CheckIsCollect alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    cic.FoodId = 939;
    //    cic.UserId = 13;
    //        [[WebServiceEngine sharedEngine] asyncRequest:cic];
    //        return;
    
    //    GetFoodList *gfl = [[GetFoodList alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    gfl.PageSize = 6;
    //    gfl.PageIndex = 1;
    //    gfl.BuId = @"1";
    //    gfl.FoodType = @"";
    //
    //    [[WebServiceEngine sharedEngine] asyncRequest:gfl];
    //    return;
    
    //    GetShopData *gsd = [[GetShopData alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    [[WebServiceEngine sharedEngine] asyncRequest:gsd];
    //    return;
    
    //    UserLogin *ul = [[UserLogin alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    ul.UserName = @"test01";
    //    ul.Pwd = @"123456";
    //    [[WebServiceEngine sharedEngine] asyncRequest:ul];
    //    return;
    
    //    ShopsLogin *sl = [[ShopsLogin alloc] initWithHandler:^(BaseRequest *request) {
    //
    //    }];
    //    sl.UserName = @"test01";
    //    sl.Pwd = @"123456";
    //    [[WebServiceEngine sharedEngine] asyncRequest:sl];
    //    return;
    
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
