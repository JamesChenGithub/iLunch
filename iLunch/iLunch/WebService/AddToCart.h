//
//  AddToCart.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//字段名	描述	字段类型	是否为空	备注
//UCode	临时编码	String 	否	如：458f8bb0-ac9b-4e64-a54d-abfeecaf4086
//UserId	用户Id	Int 	否	如用户没有登录为-1
//TogoId	商家Id	Int 	否
//TogoName	商家名称	String 	否
//UnId	菜品Id	Int 	否
//PName	菜品名称	String 	否
//PPrice	菜品单价	String 	否
//PNum	数量	Int 	否
//TullPrice	菜品原价	Stirng 	否

@interface AddToCart : BaseRequest


@property (nonatomic, assign) BOOL isAddNew;

@property (nonatomic, copy) NSString *UCode;
@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, assign) NSInteger TogoId;
@property (nonatomic, copy) NSString *TogoName;
@property (nonatomic, assign) NSInteger UnId;
@property (nonatomic, copy) NSString *PName;
@property (nonatomic, copy) NSString *PPrice;
@property (nonatomic, assign) NSInteger PNum;
@property (nonatomic, copy) NSString *TullPrice;

@end

@interface AddToCartResponse : BaseResponse

@property (nonatomic, assign) NSInteger CarNum;
@property (nonatomic, assign) CGFloat CarPrice;

@end
