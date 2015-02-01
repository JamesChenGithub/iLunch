//
//  WebServiceEngine.m
//  CarOnline
//
//  Created by James on 14-8-5.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "WebServiceEngine.h"


@implementation WebServiceEngine



static WebServiceEngine *_sharedEngine = nil;
+ (instancetype)sharedEngine
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _sharedEngine = [[WebServiceEngine alloc] init];
    });
    return _sharedEngine;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _sharedSession = [NSURLSession sharedSession];
    }
    return self;
}

- (void)asyncRequest:(BaseRequest *)req
{
    [self asyncRequest:req wait:YES];
}

- (void)test
{
   NSURLSessionDataTask *task = [_sharedSession dataTaskWithURL:[NSURL URLWithString:@"http://www.baidu.com"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        DebugLog(@"=========================>>>>>>>>\nresponseString is :\n %@" , responseString);
    }];
    [task resume];
}

- (void)asyncRequest:(BaseRequest *)req wait:(BOOL)wait
{
    if (!req)
    {
        return;
    }
    
    @autoreleasepool
    {
        NSString *url = [req url];
        NSData *data = [req toWebServiceXmlData];
        NSString *soapAction = [req soapAction];

        if ([NSString isEmpty:url] || !data || [NSString isEmpty:soapAction])
        {
            DebugLog(@"请求出错了");
            return;
        }

        DebugLog(@"reqest URL = %@", url);

        NSURL *URL = [NSURL URLWithString:url];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
        [request setValue:[NSString stringWithFormat:@"%ld",(long)[data length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
        [request setValue:soapAction forHTTPHeaderField:@"SOAPAction"];

        [request setHTTPBody:data];
        


        if (wait)
        {
            [[HUDHelper sharedInstance] loading];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        }
        __block BOOL bWait = wait;
        __block BaseRequest *baseReq = req;
        
        NSURLSessionDataTask *task = [_sharedSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (bWait)
            {
                [[HUDHelper sharedInstance] stopLoading];
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            }
            
            if (error != nil)
            {
                DebugLog(@"Request = %@, Error = %@", baseReq, error);
                [[HUDHelper sharedInstance] tipMessage:kRequestError_Str];
                
                if (baseReq.failHandler)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        baseReq.failHandler(baseReq);
                    });
                }
            }
            else
            {
                NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                DebugLog(@"=========================>>>>>>>>\nresponseString is :\n %@" , responseString);
                // TODO : 正则表解析XML返回的结果
                // 改下面这句
                
                NSString *jsonString = [responseString valueOfLabel:[baseReq uriKey]];
                
                NSDictionary *dic = (NSDictionary *)[jsonString objectFromJSONString];
                NSDictionary *headDic = [dic objectForKey:@"Head"];
                baseReq.response.Head = [NSObject parse:[BaseResponseHead class] dictionary:headDic];
                
                if ([baseReq.response success])
                {
                    NSObject *bodyDicOrArray = [dic objectForKey:@"Body"];
                    [baseReq handleResponseBody:bodyDicOrArray];
                }
                else
                {
                    if (baseReq.failHandler)
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            baseReq.failHandler(baseReq);
                        });
                    }
                    
                    
                    NSString *message = [baseReq.response message];
                    if (![NSString isEmpty:message])
                    {
                        [[HUDHelper sharedInstance] tipMessage:message];
                    }
                    else
                    {
                        [[HUDHelper sharedInstance] tipMessage:kRequestError_Str];
                    }
                }
                
            }
        }];
        
        [task resume];

    }
}


//- (void)asyncRequest:(BaseRequest *)req wait:(BOOL)wait
//{
//    if (!req)
//    {
//        return;
//    }
//    
//    
//
//    @autoreleasepool
//    {
//        NSString *url = [req url];
//        NSData *data = [req toWebServiceXmlData];
//        NSString *soapAction = [req soapAction];
//        
//        if ([NSString isEmpty:url] || !data || [NSString isEmpty:soapAction])
//        {
//            DebugLog(@"请求出错了");
//            return;
//        }
//        
//        DebugLog(@"reqest URL = %@", url);
//        
//        NSURL *URL = [NSURL URLWithString:url];
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
//        [request setValue:[NSString stringWithFormat:@"%ld",(long)[data length]] forHTTPHeaderField:@"Content-Length"];
//        [request setHTTPMethod:@"POST"];
//        [request setValue:@"text/xml;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//        [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
//        [request setValue:soapAction forHTTPHeaderField:@"SOAPAction"];
//        
//        [request setHTTPBody:data];
//        
//        if (wait)
//        {
//            [[HUDHelper sharedInstance] loading];
//            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//        }
//        __block BOOL bWait = wait;
//        __block BaseRequest *baseReq = req;
//        
//        
//        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *urlResponce, NSData *data, NSError *error)
//         {
//             if (bWait)
//             {
//                 [[HUDHelper sharedInstance] stopLoading];
//                 [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//             }
//             
//             if (error != nil)
//             {
//                 DebugLog(@"Request = %@, Error = %@", baseReq, error);
//                 [[HUDHelper sharedInstance] tipMessage:kRequestError_Str];
//                 
//                 if (baseReq.failHandler)
//                 {
//                     dispatch_async(dispatch_get_main_queue(), ^{
//                         baseReq.failHandler(baseReq);
//                     });
//                 }
//             }
//             else
//             {
//                 NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                 DebugLog(@"=========================>>>>>>>>\nresponseString is :\n %@" , responseString);
//                 // TODO : 正则表解析XML返回的结果
//                 // 改下面这句
//                 
//                 NSString *jsonString = [responseString valueOfLabel:[baseReq uriKey]];
//                 
//                 NSDictionary *dic = (NSDictionary *)[jsonString objectFromJSONString];
//                 NSDictionary *headDic = [dic objectForKey:@"Head"];
//                 baseReq.response.Head = [NSObject parse:[BaseResponseHead class] dictionary:headDic];
//                 
//                 if ([baseReq.response success])
//                 {
//                     NSDictionary *bodyDic = [dic objectForKey:@"Body"];
//                     [baseReq handleResponseBody:bodyDic];
//                 }
//                 else
//                 {
//                     if (baseReq.failHandler)
//                     {
//                         dispatch_async(dispatch_get_main_queue(), ^{
//                             baseReq.failHandler(baseReq);
//                         });
//                     }
//                     
//                     
//                     NSString *message = [baseReq.response message];
//                     if (![NSString isEmpty:message])
//                     {
//                         [[HUDHelper sharedInstance] tipMessage:message];
//                     }
//                     else
//                     {
//                         [[HUDHelper sharedInstance] tipMessage:kRequestError_Str];
//                     }
//                 }
//                 
//             }
//         }];
//    }
//}




@end

