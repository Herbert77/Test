//
//  PersistencyManager.m
//  Test
//
//  Created by Herbert on 14-3-26.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "PersistencyManager.h"

@interface PersistencyManager () {
    // an array of all books
    NSMutableArray *books;
    
}
@end

@implementation PersistencyManager

-(id) init {

    self = [super init];

    if (self) {
        // a dummy list of books
        books = [NSMutableArray arrayWithArray:@[
        
               [[Book alloc]initWithTitle:@"纸牌屋" writer:@"迈克尔·道布斯" publisher:@"百花洲文艺出版社"nameOfCover:@"s27222327.jpg" ISBN:@"9787550008496"],
               [[Book alloc]initWithTitle:@"长玻璃脚的女孩" writer:@"亚利" publisher:@"燕山出版社"nameOfCover:@"s27210708.jpg" ISBN:@" 9787540233518"],
                [[Book alloc]initWithTitle:@"反脆弱" writer:@"[美]纳西姆•尼古拉斯•塔勒布" publisher:@"中信出版社"nameOfCover:@"s27196248.jpg" ISBN:@"9787508643335"],
               [[Book alloc]initWithTitle:@"我们，是否还有好时光" writer:@"伊北" publisher:@"江苏文艺出版社"nameOfCover:@"s27232389.jpg" ISBN:@"9787539972046"],
               [[Book alloc]initWithTitle:@"吃早餐，彻底改变了我" writer:@"Hana / 卤猫" publisher:@"中国华侨出版社"nameOfCover:@"s27218475.jpg" ISBN:@"9787511343512"] ]];
    }
    return self;
}

// get book method
-(NSArray *) getBooks {
    return books;
}

// add book method
-(void) addBook:(Book *)book atIndex:(int)index {
    
    if (books.count >= index) {
        [books insertObject:book atIndex:index];
    } else {
        [books addObject:book];
    }
}


// delete book method
-(void) deleteBookAtIndex:(int)index {
    
    [books removeObjectAtIndex:index];
    NSLog(@"%i is removed.", index);
}


@end
