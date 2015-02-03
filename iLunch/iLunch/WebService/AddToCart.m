//
//  AddToCart.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AddToCart.h"

@implementation AddToCart

- (NSDictionary *)bodyDictionary
{
    if (self.isAddNew)
    {
//        @property (nonatomic, copy) NSString *UCode;
//        @property (nonatomic, assign) NSInteger UserId;
//        @property (nonatomic, assign) NSInteger TogoId;
//        @property (nonatomic, copy) NSString *TogoName;
//        @property (nonatomic, assign) NSInteger UnId;
//        @property (nonatomic, copy) NSString *PName;
//        @property (nonatomic, copy) NSString *PPrice;
//        @property (nonatomic, assign) NSInteger PNum;
//        @property (nonatomic, copy) NSString *TullPrice;
        
        NSDictionary *dic = @{@"UCode" : _UCode ? _UCode : @"",
                              @"UserId" : @(_UserId),
                              @"TogoId" : @(_TogoId),
                              @"TogoName" : _TogoName ? _TogoName : @"",
                              @"UnId" : @(_UnId),
                              @"PName" : _PName ? _PName : @"",
                              @"PPrice" : _PPrice ? _PPrice : @"",
                              @"PNum" : @(_PNum),
                              @"TullPrice" : _TullPrice ? _TullPrice : @"",
                              };
        return dic;
    }
    else
    {
        NSDictionary *dic = @{@"UCode" : _UCode ? _UCode : @"",
                              @"UnId" : @(_UnId),
                              @"PNum" : @(_PNum),
                              };
        return dic;

    }
}

- (Class)responseClass
{
    return [AddToCartResponse class];
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    AddToCartResponse *resp = (AddToCartResponse *)self.response;
    resp.CarNum = [(NSNumber *)(bodyDic[@"CarNum"]) integerValue];
    resp.CarPrice = [(NSNumber *)(bodyDic[@"CarPrice"]) floatValue];
}

@end

@implementation AddToCartResponse


@end
