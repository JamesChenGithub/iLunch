//
//  GetMyOrderList.m
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetMyOrderList.h"

@implementation GetMyOrderListItem
@end

@implementation GetMyOrderList : BaseRequest

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{
                          @"UserId" : @(_UserId),
                          @"PageIndex" : @(_PageIndex),
                          @"PageSize" : @(_PageSize),
                          };
    return dic;
}

- (Class)responseClass
{
    return [GetMyOrderListResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetMyOrderListResponse *resp = (GetMyOrderListResponse *)self.response;
    NSMutableArray *list = [NSObject loadItem:[GetMyOrderListItem class] fromArrayDictionary:bodyDic];
    resp.orderList = list;
}
@end

@implementation GetMyOrderListResponse : BaseResponse

@end

