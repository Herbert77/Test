//
//  PersistencyManager.h
//  Test
//
//  Created by Herbert on 14-3-26.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface PersistencyManager : NSObject

-(NSArray *) getBooks;
-(void) addBook:(Book *)book atIndex:(int)index;
-(void) deleteBookAtIndex:(int)index;

//-(void) saveBooks;

@end
