//
//  AddComment.h
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"


//字段名	描述	字段类型	是否为空	备注
//UserId	用户Id	int 	否
//UserName	用户名	String 	否
//TogoId	商家ID	Int 	否
//Comment	评论内容	String 	否
//Attitude	态度打分	Int	否
//Quality	品质打分	Int	否
//Speed	速度打分	Int	否

@interface AddComment : BaseRequest

@property (nonatomic, assign) NSInteger UserId;
@property (nonatomic, copy) NSString *UserName;
@property (nonatomic, assign) NSInteger TogoId;
@property (nonatomic, copy) NSString *Comment;
@property (nonatomic, assign) NSInteger Attitude;
@property (nonatomic, assign) NSInteger Quality;
@property (nonatomic, assign) NSInteger Speed;

@end

@interface AddCommentResponse : BaseResponse

@property (nonatomic, assign) BOOL commentSucc;

@end
