//
//  UpdateMyAddress.m
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "UpdateMyAddress.h"

@implementation UpdateMyAddress

- (NSDictionary *)bodyDictionary
{
    //    @property (nonatomic, assign) NSInteger DataId;
    //    @property (nonatomic, assign) NSInteger UserId;
    //    @property (nonatomic, copy) NSString *Receiver;
    //    @property (nonatomic, copy) NSString *Address;
    //    @property (nonatomic, assign) NSInteger BuildingID;
    //    @property (nonatomic, copy) NSString *Mobilephone;
    NSDictionary *dic = @{
                          @"DataId" : @(_DataId),
                          @"UserId" : @(_UserId),
                          @"Receiver" : _Receiver ? _Receiver : @"",
                          @"Address" : _Address ? _Address : @"",
                          @"BuildingID" : @(_BuildingID),
                          @"Mobilephone" : _Mobilephone ? _Mobilephone : @"",
                          };
    return dic;
}

- (Class)responseClass
{
    return [UpdateMyAddressResponse class];
    
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    UpdateMyAddressResponse *resp = (UpdateMyAddressResponse *)self.response;
    resp.updateSucc = [(NSNumber *)bodyDic[@"bool"] boolValue];
}

@end

@implementation UpdateMyAddressResponse

@end

