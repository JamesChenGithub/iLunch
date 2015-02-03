//
//  AddComment.m
//  iLunch
//
//  Created by James on 15-2-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AddComment.h"

@implementation AddComment

- (NSDictionary *)bodyDictionary
{
    //    @property (nonatomic, assign) NSInteger UserId;
    //    @property (nonatomic, copy) NSString *UserName;
    //    @property (nonatomic, assign) NSInteger TogoId;
    //    @property (nonatomic, copy) NSString *Comment;
    //    @property (nonatomic, assign) NSInteger Attitude;
    //    @property (nonatomic, assign) NSInteger Quality;
    //    @property (nonatomic, assign) NSInteger Speed;
    NSDictionary *dic = @{
                          @"UserId" : @(_UserId),
                          @"UserName" : _UserName ? _UserName : @"",
                          @"TogoId" : @(_TogoId),
                          @"Comment" : _Comment ? _Comment : @"",
                          @"Attitude" : @(_Attitude),
                          @"Quality" : @(_Quality),
                          @"Speed" : @(_Speed),
                          };
    return dic;
}

- (Class)responseClass
{
    return [AddCommentResponse class];
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    AddCommentResponse *resp = (AddCommentResponse *)self.response;
    resp.commentSucc = [(NSNumber *)bodyDic[@"bool"] boolValue];
}

@end

@implementation AddCommentResponse


@end
