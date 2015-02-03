//
//  GetMyAddress.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetMyAddress.h"

@implementation GetMyAddressItem : NSObject

@end

@implementation GetMyAddress

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
    return [GetMyAddressResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetMyAddressResponse *resp = (GetMyAddressResponse *)self.response;
    NSMutableArray *list = [NSObject loadItem:[GetMyAddressItem class] fromArrayDictionary:bodyDic];
    resp.myAddressList = list;
}


@end



@implementation GetMyAddressResponse

@end

