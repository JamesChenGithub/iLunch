//
//  DelMyAddress.h
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

@interface DelMyAddress : BaseRequest

@property (nonatomic, assign) NSInteger DataId;
@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, copy) NSString *Receiver;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, assign) NSInteger BuildingID;
@property (nonatomic, copy) NSString *Mobilephone;

@end

@interface DelMyAddressResponse : BaseResponse

@property (nonatomic, assign) BOOL delSucc;

@end