//
//  GetMyAddress.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//{
//    "DataID": 53,
//    "UserID": 13,
//    "Address": "四楼保利电影院",
//    "AddTime": "2014/10/9 20:14:53",
//    "Mobilephone": "18758595199",
//    "Receiver": "谢",
//    "BuildingName": "大中华国际交易广场"
//},

@interface GetMyAddressItem : NSObject

@property (nonatomic, assign) NSInteger DataID;
@property (nonatomic, assign) NSInteger UserID;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, copy) NSString *AddTime;
@property (nonatomic, copy) NSString *Mobilephone;
@property (nonatomic, copy) NSString *Receiver;
@property (nonatomic, copy) NSString *BuildingName;

@end

@interface GetMyAddress : BaseRequest

@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, assign) NSInteger PageIndex;
@property (nonatomic, assign) NSInteger PageSize;

@end

@interface GetMyAddressResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *myAddressList;

@end
