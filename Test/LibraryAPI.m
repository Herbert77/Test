//
//  LibraryAPI.m
//  Test
//
//  Created by Herbert on 14-3-26.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "LibraryAPI.h"
#import "PersistencyManager.h"

@interface LibraryAPI () {
    PersistencyManager *persistencyManager;
    
    BOOL isOnline;
}

@end


@implementation LibraryAPI

+(LibraryAPI *) sharedInstance {
    
    static LibraryAPI *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    
    return _sharedInstance;
}

-(id) init {
    self = [super init];
    
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        
        isOnline = NO;
    }
    return self;
}

// Facade Pattern

-(NSArray *) getBooks {
    return [persistencyManager getBooks];
}

-(void) addBook:(Book *)book atIndex:(int)index {
    [persistencyManager addBook:book atIndex:index];
    
    if (isOnline) {
        // TODO: 网络资源请求
    }
}

-(void) deleteBookAtIndex:(int)index {
    [persistencyManager deleteBookAtIndex:index];
    
    if (isOnline) {
        // TODO:
    }
}



@end
