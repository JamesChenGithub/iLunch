//
//  SubmitOrder.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//字段名	描述	字段类型	是否为空	备注
//UCode	临时编码	String 	否	如：458f8bb0-ac9b-4e64-a54d-abfeecaf4086
//UserId	用户ID	Int 	否
//Address	地址	String	否
//AddressID	地址ID	int	否
//Remark	备注	String	否
//SendTime	用餐时间	String 	否
//OrderType	订单类型	Int 	否	0:表示打包，1：表示订座，2：表示外卖

@interface SubmitOrder : BaseRequest

@property (nonatomic, copy) NSString *UCode;
@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, assign) NSInteger AddressID;
@property (nonatomic, copy) NSString *Remark;
@property (nonatomic, copy) NSString *SendTime;
@property (nonatomic, assign) NSInteger OrderType;

@end

//字段名	描述	字段类型	是否为空	备注
//OrderId	订单编号	String 	否	多个订单ID用英文“|”隔开
@interface SubmitOrderResponse : BaseResponse

@property (nonatomic, copy) NSString *OrderId;

@end
