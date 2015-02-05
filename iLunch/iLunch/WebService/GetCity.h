//
//  GetCity.h
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"


// <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body><GetCityResponse xmlns="http://tempuri.org/"><GetCityResult>{ "Head": { "ResultCode": "00","ResultInfo": "查询成功" },"Body": [{"CID":4,"CityName":"深圳","Code":"sz","Sort":4,"IsShow":1},{"CID":3,"CityName":"广州","Code":"gz","Sort":3,"IsShow":1},{"CID":1,"CityName":"北京","Code":"bj","Sort":1,"IsShow":1}]}</GetCityResult></GetCityResponse></s:Body></s:Envelope>

@interface CityItem : NSObject<ListAbleItem, LocationShowAbleItem>

@property (nonatomic, assign) NSInteger CID;
@property (nonatomic, copy) NSString *CityName;
@property (nonatomic, copy) NSString *Code;
@property (nonatomic, assign) NSInteger Sort;
@property (nonatomic, assign) BOOL IsShow;
@property (nonatomic, strong) NSMutableArray *sections;

- (instancetype)initWith:(CityItem *)item;


- (NSString *)getBuildingName;


@end


// <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body><GetSectionResponse xmlns="http://tempuri.org/"><GetSectionResult>{ "Head": { "ResultCode": "00","ResultInfo": "查询成功" },"Body": [{"Num":0,"pri":97,"SectionID":5,"Cid":0,"SectionName":"福田区"},{"Num":0,"pri":96,"SectionID":6,"Cid":0,"SectionName":"罗湖区"},{"Num":0,"pri":95,"SectionID":7,"Cid":0,"SectionName":"宝安区"},{"Num":0,"pri":94,"SectionID":8,"Cid":0,"SectionName":"龙岗区"},{"Num":0,"pri":93,"SectionID":9,"Cid":0,"SectionName":"龙华区"},{"Num":0,"pri":92,"SectionID":10,"Cid":0,"SectionName":"盐田区"},{"Num":0,"pri":85,"SectionID":17,"Cid":0,"SectionName":"南山区"}]}</GetSectionResult></GetSectionResponse></s:Body></s:Envelope>


@interface CitySectionItem : NSObject<ListAbleItem, LocationShowAbleItem>

@property (nonatomic, assign) NSInteger Num;
@property (nonatomic, assign) NSInteger pri;
@property (nonatomic, assign) NSInteger SectionID;
@property (nonatomic, assign) NSInteger Cid;
@property (nonatomic, copy) NSString *SectionName;
@property (nonatomic, strong) NSMutableArray *buildings;


@end


//{"DataID":193,"Name":"汇泰大厦","Address":"","Type":1,"Picture":"","Remark":"","SectionID":1,"FirstL":"H","SectionName":null,"XYUrl":"","Lat":"30.274089","Lng":"120.155069","isShow":1}

@interface CitySectionBuildingItem : NSObject<LocationShowAbleItem>

@property (nonatomic, assign) NSInteger DataID;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *Remark;
@property (nonatomic, assign) NSInteger SectionID;
@property (nonatomic, copy) NSString *FirstL;
@property (nonatomic, copy) NSString *SectionName;
@property (nonatomic, copy) NSString *XYUrl;
@property (nonatomic, copy) NSString *Lat;
@property (nonatomic, copy) NSString *Lng;
@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, assign) BOOL isCheckedInMyLocation;


@end

//===================================================

@interface GetCity : BaseRequest

@end

@interface GetCityResponse : BaseResponse

@property (nonatomic, strong) NSMutableArray *cityList;

@end

//===================================================


@interface GetSection : BaseRequest

@property (nonatomic, strong) CityItem *city;

@end


//===========================================
@interface GetBuilding : BaseRequest

@property (nonatomic, strong) CitySectionItem *section;

@end


