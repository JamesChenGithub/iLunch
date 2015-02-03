//
//  CheckIsCollect.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

@interface CheckIsCollect : BaseRequest

@property (nonatomic, assign) NSInteger FoodId;
@property (nonatomic, assign) NSInteger UserId;

@end

@interface CheckIsCollectResponse : BaseResponse

@property (nonatomic, assign) BOOL isCollected;

@end
