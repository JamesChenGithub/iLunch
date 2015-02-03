//
//  UserLogin.h
//  iLunch
//
//  Created by James on 15-1-28.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseRequest.h"

//
//"PhoneActivate": 1,
//"Usermoney": 0,
//"DataID": 13,
//"Name": "test01",
//"TrueName": "",
//"Sex": null,
//"Tell": "18758580301",
//"Phone": "",
//"QQ": "",
//"MSN": "",
//"RegTime": "/Date(1358237317720+0800)/",
//"Point": 616,
//"Picture": "",
//"State": null,
//"EMAIL": "1738596885@qq.com",
//"Password": "827ccb0eea8a706c4c34a16891f84e7b",
//"IsActivate": 355,
//"ActivateCode": "u3axvu6e7szicqc5p9a7w4tnt1atzgwqck2k46usus7n1un7aspnkdrq9n5ujdeqv97rns1ific4w5myd3i8t94yucbg1z7gdhtrmwjir5822nt416ghv7xm68xbgjhfbvrecwcghzgn13x7i7gviqm6j6kdz837nsr6xer4u1zvram3bqs94nxm9jv7aygaxa18bsa5",
//"GroupID": 17,
//"WebSite": "beijing",
//"RID": "",
//"openid": null,
//"wtype": null,
//"PayPassword": "e10adc3949ba59abbe56e057f20f883e"


//====================================

@interface LoginedUser : NSObject

@property (nonatomic, assign) BOOL PhoneActivate;
@property (nonatomic, assign) NSInteger Usermoney;
@property (nonatomic, assign) NSInteger DataID;
@property (nonatomic, copy) NSString  *Name;
@property (nonatomic, copy) NSString *TrueName;
@property (nonatomic, copy) NSString *Sex;
@property (nonatomic, copy) NSString *Tell;
@property (nonatomic, copy) NSString *Phone;
@property (nonatomic, copy) NSString *QQ;
@property (nonatomic, copy) NSString *MSN;
@property (nonatomic, copy) NSString *RegTime;
@property (nonatomic, assign) NSInteger Point;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, assign) NSInteger State;
@property (nonatomic, copy) NSString *EMAIL;
@property (nonatomic, copy) NSString *Password;
@property (nonatomic, assign) BOOL IsActivate;
@property (nonatomic, copy) NSString *ActivateCode;
@property (nonatomic, assign) NSInteger GroupID;
@property (nonatomic, copy) NSString *WebSite;
@property (nonatomic, assign) NSInteger openid;
@property (nonatomic, copy) NSString *wtype;
@property (nonatomic, copy) NSString *PayPassword;

@end

//============================
//"Body": {
//    "Unid": "805",
//    "Name": "神龙寨原生态主题餐厅",
//    "Address": "玉环城中路102号（夕阳红山庄对面）",
//    "Picture": "~/upload/201303/201303081735431312.jpg",
//    "LoginName": "test01"
//}

@interface LoginedShop : NSObject

@property (nonatomic, copy) NSString *Unid;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *LoginName;

@end


//==========================================

@interface UserLogin : BaseRequest

@property (nonatomic, copy) NSString *UserName;
@property (nonatomic, copy) NSString *Pwd;

@end

@interface UserLoginResponse : BaseResponse

@property (nonatomic, strong) LoginedUser *loginedUser;

@end

//==========================================

@interface ShopsLogin : BaseRequest

@property (nonatomic, copy) NSString *UserName;
@property (nonatomic, copy) NSString *Pwd;

@end

@interface ShopsLoginResponse : BaseResponse

@property (nonatomic, strong) LoginedShop *loginedShop;

@end
