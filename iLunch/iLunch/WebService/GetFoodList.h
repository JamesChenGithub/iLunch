//
//  GetFoodList.h
//  iLunch
//
//  Created by James on 15-1-28.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//字段名	描述	字段类型	是否为空	备注
//Unid	编号	Int
//InUse	是否上下架	stirng		y 上架，n 下架，d  删除
//FoodNo	菜品总分类	String
//FoodName	菜品名称	String
//FPrice	价格	decimal
//Picture	图片	String
//FPInDate	价格录入日期	DateTime
//Taste	口味	String
//FPMaster	菜品隶属餐馆编号	String
//Remains	剩余数量 	int		*已修改，用作已售
//Picture1	图片	String
//IsRecommend	统计是否热门菜	int
//Label	标签	String
//Name	餐馆名称	String
//EBuilding	所属建筑Id	String
//category	分类Id	int
//SortName	分类名称	String
//commentNum	评论数	int


//{
//    "Unid": 950,
//    "InUse": "y",
//    "FoodNo": "          ",
//    "FoodName": "川香回锅肉",
//    "FPrice": 15,
//    "Picture": "~/upload/201411/201411042132509241.jpg",
//    "FPInDate": "/Date(1415189912020+0800)/",
//    "Taste": "好吃1",
//    "FPMaster": 805,
//    "Remains": 1,
//    "Picture1": "~/upload/201411/201411042132509241.jpg",
//    "IsRecommend": 0,
//    "Label": "辣",
//    "Name": "神龙寨原生态主题餐厅",
//    "EBuilding": "{206},{213}",
//    "category": "{1},{2}",
//    "SortName": "早点类",
//    "commentNum": 0
//}

@interface GetFoodListItem : NSObject

@property (nonatomic, assign) NSInteger Unid;
@property (nonatomic, copy) NSString *InUse;
@property (nonatomic, copy) NSString *FoodNo;
@property (nonatomic, copy) NSString *FoodName;
@property (nonatomic, assign) CGFloat FPrice;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, strong) NSDate *FPInDate;
@property (nonatomic, copy) NSString *Taste;
@property (nonatomic, copy) NSString *FPMaster;
@property (nonatomic, assign) NSInteger Remains;
@property (nonatomic, copy) NSString *Picture1;
@property (nonatomic, assign) NSInteger IsRecommend;
@property (nonatomic, copy) NSString *Label;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *EBuilding;
@property (nonatomic, assign) NSInteger category;
@property (nonatomic, copy) NSString *SortName;
@property (nonatomic, assign) NSInteger commentNum;




@end

///====================================


//字段名	描述	字段类型	是否为空	备注
//PageSize	条数	Int	否
//PageIndex	页码	Int	否
//BuId	建筑物ID	String	否
//KeyWords	搜索关键字	Stirng	是	菜品名称
//SalesMethod	销售方式	Int	否	0:表示打包，1：表示订座，2：表示外卖
//FoodType	分类	String	否	收藏传：sc，其它传中文
//UserId	用户Id	Int 	是	查询当前用户收藏菜品列表时传入当前用户ID（可以空）

@interface GetFoodList : BaseRequest

@property (nonatomic, assign) NSInteger PageSize;
@property (nonatomic, assign) NSInteger PageIndex;
@property (nonatomic, copy) NSString *BuId;
@property (nonatomic, copy) NSString *KeyWords;
@property (nonatomic, assign) NSInteger SalesMethod;
@property (nonatomic, copy) NSString *FoodType;
@property (nonatomic, assign) NSInteger UserId;

@end

@interface GetFoodListResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *foodList;

@end
