//
//  GetComment.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetComment.h"

@implementation GetCommentItem


@end

@implementation GetComment

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{
                          @"UserId" : @(_UserId),
                          @"TogoId" : @(_TogoId),
                          @"Page" : @(_Page),
                          };
    return dic;
}

- (Class)responseClass
{
    return [GetCommentResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetCommentResponse *resp = (GetCommentResponse *)self.response;
    resp.commentList = [NSObject loadItem:[GetCommentItem class] fromArrayDictionary:bodyDic];
}


@end

@implementation GetCommentResponse



@end
