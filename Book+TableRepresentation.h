//
//  Book+TableRepresentation.h
//  Test
//
//  Created by Herbert on 14-3-25.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "Book.h"

@interface Book (TableRepresentation)

-(NSDictionary *) tr_tableRepresentation;

@end
