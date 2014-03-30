//
//  SearchBooksViewController.h
//  Test
//
//  Created by 胡 传业 on 14-2-24.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Book;

@interface SearchBooksViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate>
{
    
    NSArray *namesOfBooks;  // title
    NSArray *writers;        // writer
    NSArray *publishers;     // publisher
    NSArray *namesOfImages; // nameOfCover
    NSArray *introduction;
    NSArray *ISBN;           // ISBN
    
    NSArray *searchResults;
}

@property IBOutlet UITableView *tableView;
@property IBOutlet UISearchBar *searchBar;





-(id) initForNewBook:(BOOL) isNew;

-(void) filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope;

@end
