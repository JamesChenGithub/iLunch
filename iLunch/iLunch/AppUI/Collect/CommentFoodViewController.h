//
//  CommentFoodViewController.h
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface CommentFoodViewController : BaseViewController
{
    HeaderTitleView *_foodHead;
    UIPlaceHolderTextView *_comment;
    UIButton        *_publish;
}
@end
