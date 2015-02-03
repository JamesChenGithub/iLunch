//
//  UpdateOrder.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "UpdateOrder.h"

@implementation UpdateOrder

- (NSDictionary *)bodyDictionary
{
//    @property (nonatomic, copy) NSString *OrderId;
//    @property (nonatomic, assign) NSInteger PayMode;
//    @property (nonatomic, assign) NSInteger PayState;
    NSDictionary *dic = @{@"OrderId" : _OrderId ? _OrderId : @"",
                          @"PayMode" : @(_PayMode),
                          @"PayState" : @(_PayState),
                          
                          };
    return dic;
}

- (Class)responseClass
{
    return [UpdateOrderResponse class];
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    UpdateOrderResponse *resp = (UpdateOrderResponse *)self.response;
    resp.updateSucc = [(NSNumber *)(bodyDic[@"bool"]) boolValue];
}

@end

@implementation UpdateOrderResponse



@end
