//
//  GetComment.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"


//{
//    "picture": "",
//    "Rcontent": "",
//    "Rtype": 0,
//    "Rtime": "/Date(-2209017600000+0800)/",
//    "DataID": 9,
//    "UserID": 13,
//    "TogoID": 811,
//    "Point": 1,
//    "Comment": "不错的哦！",
//    "PostTime": "/Date(1408025305913+0800)/",
//    "ServiceGrade": 5,
//    "FlavorGrade": 5,
//    "SpeedGrade": 5,
//    "UserName": "test01",
//    "TogoName": "金膳宫韩国料理",
//    "FoodName": ""
//}
@interface GetCommentItem : NSObject

@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *Rcontent;
@property (nonatomic, assign) NSInteger Rtype;
@property (nonatomic, copy) NSString *Rtime;
@property (nonatomic, assign) NSInteger DataID;
@property (nonatomic, assign) NSInteger UserID;
@property (nonatomic, assign) NSInteger TogoID;
@property (nonatomic, assign) NSInteger Point;
@property (nonatomic, copy) NSString *Comment;
@property (nonatomic, copy) NSString *PostTime;
@property (nonatomic, assign) NSInteger ServiceGrade;
@property (nonatomic, assign) NSInteger FlavorGrade;
@property (nonatomic, assign) NSInteger SpeedGrade;
@property (nonatomic, copy) NSString *UserName;
@property (nonatomic, copy) NSString *TogoName;
@property (nonatomic, copy) NSString *FoodName;


@end

@interface GetComment : BaseRequest

@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, assign) NSInteger TogoId;
@property (nonatomic, assign) NSInteger Page;

@end

@interface GetCommentResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *commentList;

@end
