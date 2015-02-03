//
//  SubmitOrder.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "SubmitOrder.h"

@implementation SubmitOrder

- (NSDictionary *)bodyDictionary
{
//    @property (nonatomic, copy) NSString *UCode;
//    @property (nonatomic, assign) NSInteger UserId;
//    @property (nonatomic, copy) NSString *Address;
//    @property (nonatomic, assign) NSInteger AddressID;
//    @property (nonatomic, copy) NSString *Remark;
//    @property (nonatomic, copy) NSString *SendTime;
//    @property (nonatomic, assign) NSInteger OrderType;
    
    NSDictionary *dic = @{@"UCode" : _UCode ? _UCode : @"",
                          @"UserId" : @(_UserId),
                          @"Address" : _Address ? _Address : @"",
                          @"AddressID" : @(_AddressID),
                          @"Remark" : _Remark ? _Remark : @"",
                          @"SendTime" : _SendTime ? _SendTime : @"",
                          @"OrderType" : @(_OrderType),
                          };
    return dic;
}

- (Class)responseClass
{
    return [SubmitOrderResponse class];
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    SubmitOrderResponse *resp = (SubmitOrderResponse *)self.response;
    resp.OrderId = bodyDic[@"OrderId"];
}

@end

@implementation SubmitOrderResponse

@end
