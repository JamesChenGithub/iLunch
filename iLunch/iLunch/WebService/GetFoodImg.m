//
//  GetFoodImg.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetFoodImg.h"

@implementation GetFoodImg

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{@"ImgUrl" : _ImgUrl ? _ImgUrl : @"",
                          @"Width" : @(_Width),
                          };
    return dic;
}

@end
