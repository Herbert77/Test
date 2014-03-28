//
//  Book.m
//  Test
//
//  Created by Herbert on 14-3-25.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "Book.h"

@implementation Book

-(id) initWithTitle:(NSString *)title writer:(NSString *)writer publisher:(NSString *)publisher nameOfCover:(NSString *)nameOfCover ISBN:(NSString *)isbn {
    
    self = [super init];
    
    if (self) {
        _title = title;
        _writer = writer;
        _publisher = publisher;
        _nameOfCover = nameOfCover;
        _ISBN = isbn;
    }
    return self;
}

@end
