//
//  SearchBooksDetailController.m
//  Test
//
//  Created by 胡 传业 on 14-3-2.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "SearchBooksDetailController.h"

@interface SearchBooksDetailController ()

@end

@implementation SearchBooksDetailController
@synthesize navigationBar = _navigationBar;
@synthesize cancel = _cancel;
@synthesize sure = _sure;

@synthesize  imageView = _imageView, nameOfBook = _nameOfBook, writer = _writer, publisher = _publisher, ISBN_number = _ISBN_number;

@synthesize nameOfBooks_detail = _nameOfBooks_detail, nameOfImages_detail = _nameOfImages_detail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
//    self = [super initWithNibName:@"SearchBooksDetailController" bundle:nil];
       self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSLog(@"the nib has been loaded.");
        
        _imageView = [[UIImageView alloc] init];
        
//        _nameOfBook = [[UILabel alloc] init];
        
        _writer = [[UILabel alloc] init];
        
    }
    return self;
}



//-(id) init {
//    
//    self = [super init];
//    
//    if (self) {
//        
//        _cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
//        
//        NSLog(@" _cancel ----------");
//        
//        _sure = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(sure:)];
//        
//    }
//    
//    return self;
//    
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    if (self.searchDisplayControllerIsActive == YES) {
//        _nameOfBook.text = [_nameOfBooks_detail objectAtIndex:_theRow];
//        
//    } else {
//        
//        
//    }
    _nameOfBook.text = [_nameOfBooks_detail objectAtIndex:_theRow];
    
    _imageView.image = [UIImage imageNamed:[_nameOfImages_detail objectAtIndex:_theRow]];
    
    
}

-(IBAction) cancel:(id) sender {
    
    NSLog(@"cancel: ");
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction) sure:(id) sender {
    NSLog(@"sure: ");
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
