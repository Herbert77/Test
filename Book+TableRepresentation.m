//
//  Book+TableRepresentation.m
//  Test
//
//  Created by Herbert on 14-3-25.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "Book+TableRepresentation.h"

@implementation Book (TableRepresentation)

-(NSDictionary *) tr_tableRepresentation {
    
//    return @{@"titles":@[@"Title", @"Writer", @"publisher", @"NameOfCover", @"ISBN"],
//             @"values":@[self.title, self.writer, self.publisher, self.nameOfCover, self.ISBN]};
    
    return @{@"Title":self.title, @"Writer":self.writer, @"Publisher":self.publisher, @"NameOfCover":self.nameOfCover, @"ISBN":self.ISBN};
    
}

@end
