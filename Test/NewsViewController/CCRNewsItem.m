//
//  CCRNewsItem.m
//  CharingCrossRoad
//
//  Created by Erkang on 14-3-6.
//  Copyright (c) 2014年 Erkang. All rights reserved.
//

#import "CCRNewsItem.h"

@implementation CCRNewsItem

@synthesize avatarKey;
@synthesize userName, bookName, pageNumber, comSummary;



// 这是用来测试的假数据生成器
+ (id)randomItem
{
    // Create an array of three user
    NSArray *randomUserList = [NSArray arrayWithObjects:@"张尔康",
                                    @"胡传业",
                                    @"刘任驰",
                                    nil];
    // Create an array of three book name
    NSArray *randomBookList = [NSArray arrayWithObjects:@"查令十字街84号",
                               @"1995-2005 夏至未至",
                               @"GRE 核心词汇考法精析", nil];
    // Create an array of three book summary
    NSArray *randomSummaryList = [NSArray arrayWithObjects:@"一本书遭到了批评，实际上说明它引起了真实的、毫不虚假的关注，表明它不是一本无聊的书，要知道，无聊是一本书最致命的缺陷。",
                               @"感觉不会再爱了！",
                               @"前两年就有对于这类人的时髦称呼——“晨型人”，是指坚持晚上早早睡觉，早晨四五点钟就起床的人，严格意义上，如果是早晨六点起床，那还只是早起者。日本“早起心身研究所”的所长税所弘，是“晨型人”观念的提出者。", nil];
    
    // Get the index of a random adjective/noun from the lists
    // Note: The % operator, called the modulo operator, gives you the remainder. So adjectiveIndex is a random number from 0 to 2 inclusive.
    
    NSInteger userIndex = rand() % [randomUserList count];
    NSInteger bookIndex = rand() % [randomBookList count];
    NSInteger summaryIndex = rand() % [randomSummaryList count];
    
    // Note that NSInteger is not an object, but a type definition for "unsigned long"
    
    NSString *randomUserName = [NSString stringWithFormat:@"%@", [randomUserList objectAtIndex:userIndex]];
    NSString *randomBookName = [NSString stringWithFormat:@"%@", [randomBookList objectAtIndex:bookIndex]];
    NSString *randomSummary = [NSString stringWithFormat:@"%@", [randomSummaryList objectAtIndex:summaryIndex]];

    int randomPage = rand() % 300;
    
    // Once again, ignore the memory problems with this method
    CCRNewsItem *newItem =
    [[self alloc] initWithUserName:randomUserName
                          bookName:randomBookName
                        pageNumber:randomPage
                    commentSummary:randomSummary];
    
    return newItem;
}

- (id)init
{
    return [self initWithUserName:@"UserName"
                         bookName:@"BookName"
                       pageNumber:0
                   commentSummary:@"Comment Summary"];
}

- (id)initWithUserName:(NSString *)name
              bookName:(NSString *)book
            pageNumber:(int)page
        commentSummary:(NSString *)summary
{
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if(self) {
        // Give the instance variables initial values
        [self setUserName:name];
        [self setBookName:book];
        [self setComSummary:summary];
        [self setPageNumber:page];
    }
    
    // Return the address of the newly initialized object
    return self;
}


- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@'s comment about %@ on page %d",
     userName,
     bookName,
     pageNumber];
    return descriptionString;
}


- (void)dealloc
{
    NSLog(@"Destoryed: %@", self);
}

#pragma mark 固化相应的文件
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:userName forKey:@"userName"];
    [aCoder encodeObject:bookName forKey:@"bookName"];
    [aCoder encodeObject:comSummary forKey:@"comSummary"];
    [aCoder encodeInt:pageNumber forKey:@"pageNumber"];
    
    NSLog(@"NSCoding 成功！");
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setUserName:[aDecoder decodeObjectForKey:@"userName"]];
        [self setBookName:[aDecoder decodeObjectForKey:@"bookName"]];
        [self setComSummary:[aDecoder decodeObjectForKey:@"comSummary"]];
        [self setPageNumber:[aDecoder decodeIntForKey:@"pageNumber"]];
        
        [self setAvatarKey:[aDecoder decodeObjectForKey:@"imageKey"]];
    }
    return self;
}

@end
