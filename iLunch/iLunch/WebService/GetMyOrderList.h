//
//  GetMyOrderList.h
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//字段名	描述	字段类型	是否为空	备注
//UserId	用户Id	int 	否
//PageIndex	页码	Int 	否
//PageSize	条数	Int 	否

//"Orderid": "008160127160307350",
//"OrderRcver": "好人平安先生",
//"togoname": "测试商家",
//"OrderDateTime": "2015/1/27 16:03:07"

@interface GetMyOrderListItem : NSObject

@property (nonatomic, copy) NSString *Orderid;
@property (nonatomic, copy) NSString *OrderRcver;
@property (nonatomic, copy) NSString *togoname;
@property (nonatomic, copy) NSString *OrderDateTime;

@end

@interface GetMyOrderList : BaseRequest

@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, assign) NSInteger PageIndex;
@property (nonatomic, assign) NSInteger PageSize;

@end

@interface GetMyOrderListResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *orderList;

@end
