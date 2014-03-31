//
//  CCRNewsItemStore.h
//  CharingCrossRoad
//
//  Created by Erkang on 14-3-14.
//  Copyright (c) 2014年 Erkang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CCRNewsItem;


@interface CCRNewsItemStore : NSObject
{
    NSMutableArray *allItems;
}

+ (CCRNewsItemStore *)sharedStore;

- (void)removeItem:(CCRNewsItem *)p;

- (NSArray *)allItems;

- (CCRNewsItem *)createItem;

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to;

- (BOOL)saveChanges;

-(NSString *)itemArchivePath;

@end
