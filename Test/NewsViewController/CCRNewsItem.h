//
//  CCRNewsItem.h
//  CharingCrossRoad
//
//  Created by Erkang on 14-3-6.
//  Copyright (c) 2014年 Erkang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCRNewsItem : NSObject <NSCoding>
{
}

+ (id)randomItem;

// 加载用户名、书名、页码和笔记摘要
- (id)initWithUserName:(NSString *)name
              bookName:(NSString *)book
            pageNumber:(int)page
        commentSummary:(NSString *)summary;


@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, copy) NSString *comSummary;
@property (nonatomic, readwrite) int pageNumber;

// 虽然cell上会显示两张图片，页码的底色图片是不需要提取的，所以忽略它
@property (nonatomic, copy) NSString *avatarKey;

@end
