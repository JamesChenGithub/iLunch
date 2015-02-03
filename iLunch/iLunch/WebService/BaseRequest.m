//
//  BaseRequest.m
//  CarOnline
//
//  Created by James on 14-8-4.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

// =========================================

@implementation BaseRequest

- (NSString *)uriKey
{
    return [NSString stringWithFormat:@"%@Result", NSStringFromClass([self class])];
}

- (instancetype)initWithHandler:(RequestCompletionHandler)succHandler
{
    if (self = [self init])
    {
        self.succHandler = succHandler;
    }
    return self;
}

- (instancetype)initWithHandler:(RequestCompletionHandler)succHandler failHandler:(RequestCompletionHandler)fail
{
    if (self = [self initWithHandler:succHandler]) {
        self.failHandler = fail;
    }
    return self;
}

//- (NSString *)uriKey
//{
//    return _uriKey;
//}

//- (NSString *)uri
//{
//    // TODO : overwrite by subclass
//    return @"/WebServer/APPWSDataApi.asmx";
//}

- (NSString *)url
{
    return @"http://121.199.15.192/awcwcf/Service1.svc";
}

- (NSString *)soapAction
{
    NSString *soapAction = [NSString stringWithFormat:@"http://tempuri.org/IService1/%@", NSStringFromClass([self class])];
    return soapAction;
}

- (NSDictionary *)headDictionary
{
//    LoginUser *user = [WebServiceEngine sharedEngine].user;
//    BOOL hasUserCode = user && ![NSString isEmpty:user.UserCode];
//    BOOL hasPwd = user && ![NSString isEmpty:user.Password];
    
    NSDictionary *dic = @{@"Version" : @"1",
                          @"MachineType" : @"1",
                          @"UserCode" : @"awc",
                          @"Password" : @"123456"
                          };
    return dic;
}

- (NSDictionary *)bodyDictionary
{
    return nil;
}

- (NSString *)contentJSON
{
    NSDictionary *headDic = [self headDictionary];
    
    NSString *headJson = nil;
    
    if ([NSJSONSerialization isValidJSONObject:headDic])
    {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:headDic options:NSJSONWritingPrettyPrinted error: &error];
        headJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        headJson = [headJson removeNewLine];
    }
    
    if ([NSString isEmpty:headJson])
    {
        DebugLog(@"head json 不能为空");
        return nil;
    }
    
    
    NSDictionary *bodydic = [self bodyDictionary];
    NSString *bodyJson = @"{}";
    
    if ([NSJSONSerialization isValidJSONObject:bodydic])
    {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:bodydic options:NSJSONWritingPrettyPrinted error: &error];
        bodyJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        [bodyJson removeNewLine];
    }
    
    NSString *contentJson = [NSString stringWithFormat:@"{\"Head\":%@, \"Body\":%@}", headJson, bodyJson];
    contentJson = [contentJson removeWhiteSpace];
    DebugLog(@"[---%@----]post XML is : %@", [self class], contentJson);
    return contentJson;
}

- (NSData *)contentJSONData
{
    NSString *contentJson = [self contentJSON];
    return [contentJson dataUsingEncoding:NSUTF8StringEncoding];
}

- (BaseResponse *)response
{
    if (!_response)
    {
        _response = [[[self responseClass] alloc] init];
    }
    return _response;
}

- (NSString *)toWebServiceXml
{
    
    //    <?xml version="1.0" encoding="utf-8"?>
    //    <SOAP-ENV:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    //    <SOAP-ENV:Body>
    //    <GetCity xmlns="http://tempuri.org/">
    //    <inJson>{"Head":{"Version":"1","MachineType":"0","UserCode":"awc","Password":"123456"},"Body":{}}</inJson>
    //    </GetCity>
    //    </SOAP-ENV:Body>
    //    </SOAP-ENV:Envelope>
    
    
    NSString *json = [self contentJSON];
    
    if ([NSString isEmpty:json])
    {
        DebugLog(@"the Key or json is nil");
        return nil;
    }
    NSString *uriKey = NSStringFromClass([self class]);
    NSMutableString *xml = [NSMutableString string];

    [xml appendString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
    [xml appendString:@"<SOAP-ENV:Envelope xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\">"];
    [xml appendString:@"<SOAP-ENV:Body>"];
    [xml appendFormat:@"<%@ xmlns=\"http://tempuri.org/\">", uriKey];
    [xml appendFormat:@"<inJson>%@</inJson>", json];
    [xml appendFormat:@"</%@></SOAP-ENV:Body></SOAP-ENV:Envelope>", uriKey];
    
    DebugLog(@"[---%@----]post XML is : %@", [self class], xml);
    return xml;

}

- (NSData *)toWebServiceXmlData
{
    NSString *xml = [self toWebServiceXml];
    return [xml dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)description
{
    return [self toWebServiceXml];
}

- (Class)responseClass;
{
    return [BaseResponse class];
}

- (void)handleResponseBody:(NSObject *)bodyDicOrArray
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (_succHandler)
        {
            // todo handle body
            if ([bodyDicOrArray isKindOfClass:[NSDictionary class]])
            {
                [self parseDictionaryBody:(NSDictionary *)bodyDicOrArray];
            }
            else if ([bodyDicOrArray isKindOfClass:[NSArray class]])
            {
                [self parseArrayBody:(NSArray *)bodyDicOrArray];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                _succHandler(self);
            });
            
        }
        else
        {
            DebugLog(@"_succHandler 为空");
        }
    });
    
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    
}

@end

// =========================================

@implementation BaseResponseHead

- (BOOL)success
{
    return [self.ResultCode isEqualToString:@"00"];
}

- (NSString *)message;
{
//    00-	成功
//    01-	失败
//    02-	接口出错
    return self.ResultInfo;
}

@end


@implementation BaseResponse

- (BOOL)success
{
    return [_Head success];
}
- (NSString *)message
{
    return [_Head message];
}

@end

// =========================================
