//
//  WebServiceEngine.h
//  CarOnline
//
//  Created by James on 14-8-5.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "MKNetworkEngine.h"


@interface WebServiceEngine : NSObject
{
    NSURLSession *_sharedSession;
}

@property (nonatomic, strong) LoginUser *user;

+ (instancetype)sharedEngine;

- (void)asyncRequest:(BaseRequest *)req;

- (void)asyncRequest:(BaseRequest *)req wait:(BOOL)wait;

- (void)test;


@end
