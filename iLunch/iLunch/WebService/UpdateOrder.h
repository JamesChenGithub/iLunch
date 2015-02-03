//
//  UpdateOrder.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//字段名	描述	字段类型	是否为空	备注
//OrderId	订单编号	String 	否	多个订单ID用英文“|”隔开
//PayMode	支付方式	Int 	否	1支付宝/2银联/3账户余额/4货到付款
//PayState	支付状态	Int 	否	0 未支付 1 成功 2支付未完成 3 支付失败
@interface UpdateOrder : BaseRequest

@property (nonatomic, copy) NSString *OrderId;
@property (nonatomic, assign) NSInteger PayMode;
@property (nonatomic, assign) NSInteger PayState;

@end

@interface UpdateOrderResponse : BaseResponse

@property (nonatomic, assign) BOOL updateSucc;

@end
