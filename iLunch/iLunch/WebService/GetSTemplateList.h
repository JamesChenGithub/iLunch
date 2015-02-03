//
//  GetSTemplateList.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

@interface GetSTemplateListItem : NSObject

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *Remark;

@end

@interface GetSTemplateList : BaseRequest

@end

@interface GetSTemplateListResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *list;

@end
