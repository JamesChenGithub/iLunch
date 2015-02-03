//
//  GetCartList.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//{
//    "DataId": 563,
//    "UId": 13,
//    "TogoId": 816,
//    "TogoName": "测试商家",
//    "PId": 949,
//    "PName": "酸辣鸡杂",
//    "PPrice": 15,
//    "PNum": 3,
//    "tempcode": "458f8bb0-ac9b-4e64-a54d-abfeecaf4088"
//}

@interface GetCartListItem : NSObject

@property (nonatomic, assign) NSInteger DataId;
@property (nonatomic, assign) NSInteger UId;
@property (nonatomic, assign) NSInteger TogoId;
@property (nonatomic, copy) NSString *TogoName;
@property (nonatomic, assign) NSInteger PId;
@property (nonatomic, copy) NSString *PName;
@property (nonatomic, assign) CGFloat PPrice;
@property (nonatomic, assign) NSInteger PNum;
@property (nonatomic, copy) NSString *tempcode;


@end

@interface GetCartList : BaseRequest

@property (nonatomic, copy) NSString *UCode;

@end

@interface GetCartListResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *cartList;

@end
