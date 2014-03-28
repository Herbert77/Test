//
//  MyBooksViewController.m
//  Test
//
//  Created by 胡 传业 on 14-2-27.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "MyBooksViewController.h"
#import "SearchBooksViewController.h"
#import "CustomCell.h"

#import "LibraryAPI.h"
#import "Book+TableRepresentation.h"
#import "PersistencyManager.h"

@interface MyBooksViewController () {
    
    NSArray *allBooks;
    NSDictionary *currentBookData;
    int currentBookIndex;
    
}
@end

@implementation MyBooksViewController
@synthesize navi_7 = _navi_7;

-(id) init {
    
    self = [super init];
    
    if (self) {
        UINavigationItem *navigationItem = [self navigationItem];
        [navigationItem setTitle:@"我的书"];
        
        UIBarButtonItem *addBookButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                target:self
                                              action:@selector(addBook:)];
        // 设置这个 栏目按键于导航栏的右方
        [[self navigationItem] setRightBarButtonItem:addBookButtonItem];
        
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableViewBackground"]];
    
    
    //1
    currentBookIndex = 0;
    
    //2
    allBooks = [[LibraryAPI sharedInstance] getBooks];
    
    
}

-(void) getDataForBookAtIndex:(int) bookIndex {
    
    if (bookIndex < allBooks.count) {
        // fetch the book
        Book *book = allBooks[bookIndex];
        // save the books data to present it later in the tableView
        currentBookData = [book tr_tableRepresentation];
    } else {
        
        currentBookData = nil;
    }
    // we have the data we need, let's refresh our tableView
//    [_tableView reloadData];
}



-(void) addBook:(id) sender {
    
//    NSLog(@"addBook message has been sent.");
    
    SearchBooksViewController *searchBooksViewController = [[SearchBooksViewController alloc] initForNewBook:YES];
    _navi_7 = [[UINavigationController alloc] initWithRootViewController:searchBooksViewController];
    
    
    // 呈现 模态视图
    [self presentViewController:_navi_7 animated:YES completion:nil];
//    [self presentViewController:SearchBooksViewController animated:YES completion:nil];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        PossessionStore *ps = [PossessionStore defaultStore];
//        NSArray *possessions = [ps allPossessions];
//        Possession *p = [possessions objectAtIndex:[indexPath row]];
//        
//        [ps removePossession:p];
//        
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:YES];
        
        [[LibraryAPI sharedInstance] deleteBookAtIndex:(int)indexPath.row];
        

        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:YES];
    }
}




#pragma mark -
#pragma mark Table view dataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // TODO:   the number of rows in section ?
    return [allBooks count];

    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    //  section 被赋值为  1
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *indentifier = @"CustomCell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    currentBookIndex =(int)indexPath.row;
    
    
    [self getDataForBookAtIndex:currentBookIndex];
    
    cell.label_1.text = currentBookData[@"Title"];
    cell.label_2.text = currentBookData[@"Writer"];
    cell.imageView.image = [UIImage imageNamed: currentBookData[@"NameOfCover"]];

    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


@end
