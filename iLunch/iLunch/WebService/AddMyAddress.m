//
//  AddMyAddress.m
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AddMyAddress.h"

@implementation AddMyAddress

- (NSDictionary *)bodyDictionary
{
    //    @property (nonatomic, assign) NSInteger UserId;
    //    @property (nonatomic, copy) NSString *Receiver;
    //    @property (nonatomic, copy) NSString *Address;
    //    @property (nonatomic, assign) NSInteger BuildingID;
    //    @property (nonatomic, copy) NSString *Mobilephone;
    NSDictionary *dic = @{
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
    return [AddMyAddressResponse class];
    
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    AddMyAddressResponse *resp = (AddMyAddressResponse *)self.response;
    resp.addSucc = [(NSNumber *)bodyDic[@"bool"] boolValue];
}

@end

@implementation AddMyAddressResponse

@end
