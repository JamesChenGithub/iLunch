//
//  GetMyCollect.m
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetMyCollect.h"

@implementation GetMyCollectItem : NSObject

@end

@implementation GetMyCollect

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
    return [GetMyCollectResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetMyCollectResponse *resp = (GetMyCollectResponse *)self.response;
    NSMutableArray *list = [NSObject loadItem:[GetMyCollectItem class] fromArrayDictionary:bodyDic];
    resp.collectList = list;
}


@end



@implementation GetMyCollectResponse

@end


//===============================================
//3.24添加我的收藏
//3.24.1 调用方法
//public string GetMyCollect(string inJson)
//3.24.2 请求参数
//字段名	描述	字段类型	是否为空	备注
//UserId	用户Id	Int	否
//FoodId	餐品Id	Int 	否
//Togoid	商家Id	Int 	否

@implementation AddMyCollect

//@property (nonatomic, assign) NSInteger UserId;
//@property (nonatomic, assign) NSInteger FoodId;
//@property (nonatomic, assign) NSInteger Togoid;

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{
                          @"UserId" : @(_UserId),
                          @"FoodId" : @(_FoodId),
                          @"Togoid" : @(_Togoid),
                          };
    return dic;
}

- (Class)responseClass
{
    return [AddMyCollectResponse class];
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    AddMyCollectResponse *resp = (AddMyCollectResponse *)self.response;
    resp.addSucc = [(NSNumber *)(bodyDic[@"bool"]) boolValue];
}


@end

@implementation AddMyCollectResponse


@end

//===============================================
//字段名	描述	字段类型	是否为空	备注
//UserId	用户Id	Int	否
//FoodId	餐品Id	Int 	否

@implementation DelMyCollect
- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{
                          @"UserId" : @(_UserId),
                          @"FoodId" : @(_FoodId),
                          };
    return dic;
}

- (Class)responseClass
{
    return [DelMyCollectResponse class];
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    DelMyCollectResponse *resp = (DelMyCollectResponse *)self.response;
    resp.delSucc = [(NSNumber *)(bodyDic[@"bool"]) boolValue];
}
@end

@implementation DelMyCollectResponse

@end


