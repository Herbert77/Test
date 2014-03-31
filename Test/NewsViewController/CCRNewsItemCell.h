//
//  CCRNewsItemCell.h
//  CharingCrossRoad
//
//  Created by Erkang on 14-3-2.
//  Copyright (c) 2014年 Erkang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCRNewsItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *Avatar;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *pageNum;
@property (weak, nonatomic) IBOutlet UILabel *comSummary;

@end
