//
//  GetMyCollect.h
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//字段名	描述	字段类型	是否为空	备注
//UserId	用户Id	Int	否
//PageIndex	页码	Int	否
//PageSize	每页数量	Int	否

//{
//    "dataid": 56,
//    "togoid": 813,
//    "userid": 13,
//    "ctime": "2014/12/28 0:22:01",
//    "Togoname": "香港湾仔茶餐厅",
//    "FoodName": "水煮肉片"
//}

@interface GetMyCollectItem : NSObject

@property (nonatomic, assign) NSInteger dataid;
@property (nonatomic, assign) NSInteger togoid;
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, copy) NSString *ctime;
@property (nonatomic, copy) NSString *Togoname;
@property (nonatomic, copy) NSString *FoodName;

@end

@interface GetMyCollect : BaseRequest

@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, assign) NSInteger PageIndex;
@property (nonatomic, assign) NSInteger PageSize;

@end

@interface GetMyCollectResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *collectList;

@end

//===============================================
//3.24添加我的收藏
//3.24.1 调用方法
//public string GetMyCollect(string inJson)
//3.24.2 请求参数
//字段名	描述	字段类型	是否为空	备注
//UserId	用户Id	Int	否
//FoodId	餐品Id	Int 	否
//Togoid	商家Id	Int 	否

@interface AddMyCollect : BaseRequest

@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, assign) NSInteger FoodId;
@property (nonatomic, assign) NSInteger Togoid;

@end

@interface AddMyCollectResponse : BaseResponse

@property (nonatomic, assign) BOOL addSucc;

@end

//===============================================
//字段名	描述	字段类型	是否为空	备注
//UserId	用户Id	Int	否
//FoodId	餐品Id	Int 	否

@interface DelMyCollect : BaseRequest

@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, assign) NSInteger FoodId;

@end

@interface DelMyCollectResponse : BaseResponse

@property (nonatomic, assign) BOOL delSucc;

@end

