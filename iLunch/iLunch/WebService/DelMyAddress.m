//
//  DelMyAddress.m
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "DelMyAddress.h"

@implementation DelMyAddress

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
    return [DelMyAddressResponse class];
    
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    DelMyAddressResponse *resp = (DelMyAddressResponse *)self.response;
    resp.delSucc = [(NSNumber *)bodyDic[@"bool"] boolValue];
}

@end

@implementation DelMyAddressResponse

@end