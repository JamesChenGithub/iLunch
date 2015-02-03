//
//  GetSTemplateList.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetSTemplateList.h"

@implementation GetSTemplateListItem



@end

@implementation GetSTemplateList

- (Class)responseClass
{
    return [GetSTemplateListResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetSTemplateListResponse *resp = (GetSTemplateListResponse *)self.response;
    NSMutableArray *list = [NSObject loadItem:[GetSTemplateListItem class] fromArrayDictionary:bodyDic];
    resp.list = list;
}

@end


@implementation GetSTemplateListResponse

@end