//
//  AddMyAddress.h
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//字段名	描述	字段类型	是否为空	备注
//UserId	用户Id	int 	否
//Receiver	收货人	String 	否
//Address	地址	String 	否
//BuildingID	建筑ID	Int 	否
//Mobilephone	手机号码	String 	否

@interface AddMyAddress : BaseRequest

@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, copy) NSString *Receiver;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, assign) NSInteger BuildingID;
@property (nonatomic, copy) NSString *Mobilephone;


@end


@interface AddMyAddressResponse : BaseResponse

@property (nonatomic, assign) BOOL addSucc;

@end
