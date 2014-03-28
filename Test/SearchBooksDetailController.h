//
//  SearchBooksDetailController.h
//  Test
//
//  Created by 胡 传业 on 14-3-2.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBooksDetailController : UIViewController <UINavigationControllerDelegate>

@property IBOutlet UINavigationBar *navigationBar;

@property IBOutlet UIBarButtonItem *cancel;

@property IBOutlet UIBarButtonItem *sure;

@property  IBOutlet UIImageView *imageView;

//@property  IBOutlet UILabel *nameOfBook;
@property (weak, nonatomic) IBOutlet UILabel *nameOfBook;

@property IBOutlet UILabel *writer;

@property  IBOutlet UILabel *publisher;

@property  IBOutlet UILabel *ISBN_number;

@property IBOutlet UILabel *textView;
//@property  IBOutlet UIScrollView *scrollView;

@property BOOL searchDisplayControllerIsActive;

@property int theRow;

@property NSArray *nameOfBooks_detail;

@property NSArray *nameOfImages_detail;

-(IBAction) cancel:(id) sender;

-(IBAction) sure:(id)sender;



@end
