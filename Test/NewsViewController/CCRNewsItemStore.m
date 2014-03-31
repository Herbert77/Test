//
//  CCRNewsItemStore.m
//  CharingCrossRoad
//
//  Created by Erkang on 14-3-14.
//  Copyright (c) 2014年 Erkang. All rights reserved.
//

#import "CCRNewsItemStore.h"
#import "CCRNewsItem.h"

@implementation CCRNewsItemStore

+ (CCRNewsItemStore *)sharedStore
{
    static CCRNewsItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id)init
{
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePath];
        
        allItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If the array hadn't been saved previously, create a new empty one
        if(!allItems)
            allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (CCRNewsItem *)createItem
{
    CCRNewsItem *p = [CCRNewsItem randomItem];
    [allItems addObject:p];
    return p;
}

- (NSArray *)allItems
{
    return allItems;
}

- (void)removeItem:(CCRNewsItem *)p
{
    // 本列表暂不需要删除功能
}

- (void)moveItemAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    // Get pointer to the object being removed so we can re-insert it in a new place
    CCRNewsItem *p = [allItems objectAtIndex:from];
    
    // Remove P from array
    [allItems removeObjectAtIndex:from];
    
    // Insert p in array at new place
    [allItems insertObject:p atIndex:to];
}

#pragma mark 获取文件路径
- (NSString *)itemArchivePath
{
    NSArray *documentDirectories =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    
    // Get one and only document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    NSLog(@"成功获取路径！");
    return [documentDirectory stringByAppendingPathComponent:@"newsItems.archive"];
}

#pragma mark 保存文件
- (BOOL)saveChanges
{
    // 返回YES或NO，分别代表成功或失败
    NSString *path = [self itemArchivePath];
    NSLog(@"成功应用路径！");
    
    return [NSKeyedArchiver archiveRootObject:allItems toFile:path];
}

@end
