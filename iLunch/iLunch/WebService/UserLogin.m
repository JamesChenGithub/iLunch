//
//  UserLogin.m
//  iLunch
//
//  Created by James on 15-1-28.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "UserLogin.h"

@implementation  LoginedUser


@end

@implementation LoginedShop



@end

@implementation UserLogin

- (Class)responseClass
{
    return [UserLoginResponse class];
}

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{@"UserName" : _UserName, @"Pwd" : _Pwd};
    return dic;
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    UserLoginResponse *resp = (UserLoginResponse *)self.response;
    resp.loginedUser = [NSObject parse:[LoginedUser class] dictionary:bodyDic];
}

@end

@implementation UserLoginResponse



@end


@implementation ShopsLogin

- (Class)responseClass
{
    return [ShopsLoginResponse class];
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    ShopsLoginResponse *resp = (ShopsLoginResponse *)self.response;
    resp.loginedShop = [NSObject parse:[LoginedShop class] dictionary:bodyDic];
}

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{@"UserName" : _UserName, @"Pwd" : _Pwd};
    return dic;
}


@end

@implementation ShopsLoginResponse



@end
