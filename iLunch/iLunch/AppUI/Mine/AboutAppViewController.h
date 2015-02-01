//
//  AboutAppViewController.h
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface AboutAppViewController : BaseViewController
{
    UIImageView *_logo;
    UITextView  *_detail;
}

@end

@interface AboutUsViewController : AboutAppViewController

@end

@interface AboutAppCooperationViewController : AboutAppViewController

@end


@interface AboutServiceViewController : AboutAppViewController

@end


