//
//  GetFoodList.m
//  iLunch
//
//  Created by James on 15-1-28.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetFoodList.h"

@implementation GetFoodListItem


@end

@implementation GetFoodList

- (NSDictionary *)bodyDictionary
{
    //    @property (nonatomic, assign) NSInteger PageSize;
    //    @property (nonatomic, assign) NSInteger PageIndex;
    //    @property (nonatomic, copy) NSString *BuId;
    //    @property (nonatomic, copy) NSString *KeyWords;
    //    @property (nonatomic, assign) NSInteger SalesMethod;
    //    @property (nonatomic, copy) NSString *FoodType;
    //    @property (nonatomic, assign) NSInteger UserId;

    NSDictionary *dic = @{@"PageSize" : @(_PageSize),
                          @"PageIndex" : @(_PageIndex),
                          @"BuId" : _BuId ? _BuId : @"",
                          @"KeyWords" : _KeyWords ? _KeyWords : @"",
                          @"SalesMethod" : @(_SalesMethod),
                          @"FoodType" : _FoodType ? _FoodType : @"",
                          @"UserId" : @(_UserId),
                          };
    return dic;
}

- (Class)responseClass
{
    return [GetFoodListResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetFoodListResponse *resp = (GetFoodListResponse *)self.response;
    NSMutableArray *list = [NSObject loadItem:[GetFoodListItem class] fromArrayDictionary:bodyDic];
    resp.foodList = list;
}

@end

@implementation GetFoodListResponse



@end
