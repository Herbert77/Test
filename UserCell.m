//
//  UserCell.m
//  Test
//
//  Created by Herbert on 14-3-29.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

@synthesize imageView = _imageView;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
