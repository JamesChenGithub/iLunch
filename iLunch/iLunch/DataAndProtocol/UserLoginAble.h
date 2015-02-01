//
//  UserLoginAble.h
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserLoginAble <NSObject>

- (BOOL)isLogined;
- (UIImage *)userIcon;
- (NSString *)userName;
- (NSString *)password;

@end
