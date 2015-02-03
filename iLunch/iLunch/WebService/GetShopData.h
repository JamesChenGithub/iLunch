//
//  GetShopData.h
//  iLunch
//
//  Created by James on 15-1-28.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"


//{
//    "ID": 11,
//    "classname": "套餐",
//    "Depth": 2,
//    "Status": 0,
//    "Priority": 1,
//    "Parentid": 1,
//    "isDel": 0
//},

@interface GetShopDataItem : NSObject

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *classname;
@property (nonatomic, assign) NSInteger Depth;
@property (nonatomic, assign) NSInteger Status;
@property (nonatomic, assign) NSInteger Priority;
@property (nonatomic, assign) NSInteger Parentid;
@property (nonatomic, assign) BOOL isDel;


@end


@interface GetShopData : BaseRequest

@end

@interface GetShopDataResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *shopDatas;

@end
