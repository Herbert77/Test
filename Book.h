//
//  Book.h
//  Test
//
//  Created by Herbert on 14-3-25.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, copy, readonly) NSString *title, *writer, *publisher, *nameOfCover, *ISBN;

-(id) initWithTitle:(NSString *)title writer:(NSString *)writer publisher:(NSString *)publisher nameOfCover:(NSString *)nameOfCover ISBN:(NSString *) isbn;


@end
