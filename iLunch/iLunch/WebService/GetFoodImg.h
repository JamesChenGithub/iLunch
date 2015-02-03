//
//  GetFoodImg.h
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

@interface GetFoodImg : BaseRequest

@property (nonatomic, copy) NSString *ImgUrl;
@property (nonatomic, assign) NSInteger Width;

@end
