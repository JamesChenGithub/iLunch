//
//  NextMenuChainAble.h
//  iLunch
//
//  Created by James on 15-1-28.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol LocationShowAbleItem

- (NSString *)showName;

@end

@protocol ListAbleItem

- (NSArray *)list;

@end




@protocol NextMenuChainAble <NSObject>

@property (nonatomic, weak) id<ListAbleItem> selectItem;

//- (id<NextMenuChainAble>)previous;
//
//- (id<NextMenuChainAble>)next;

// return select list
- (NSArray *)dataSource;

@end
