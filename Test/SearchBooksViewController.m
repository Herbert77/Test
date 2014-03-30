//
//  SearchBooksViewController.m
//  Test
//
//  Created by 胡 传业 on 14-2-24.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "SearchBooksViewController.h"
#import "CustomCell.h"
#import "MyBooksViewController.h"
#import "SearchBooksDetailController.h"


@interface SearchBooksViewController ()

@end

@implementation SearchBooksViewController
@synthesize tableView = _tableView;


-(id) initForNewBook:(BOOL) isNew {
    
    self = [super initWithNibName:@"SearchBooksViewController" bundle:nil];

    return self;
}

-(void) add:(id) sender {
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

-(void) cancel:(id) sender {
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 设置 tableView 的 代理 和 数据源
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    // 初始化 数据
    namesOfImages = [[NSArray alloc] initWithObjects:@"1.png",@"2.png",@"3.png",@"4.png", nil];
    namesOfBooks = [[NSArray alloc] initWithObjects:@"谋杀似水年华",@"茶花女",@"汤姆叔叔的小屋",@"三个火枪手", nil];
    writers = [[NSArray alloc] initWithObjects:@"蔡骏",@"小仲马",@"斯托夫人",@"大仲马", nil];
    introduction = [NSArray arrayWithObjects:@"讲述了一部围绕南明高中发生的一系列事件...",
                    @"《茶花女》为我们塑造了一些生动、鲜明的艺术形象，而其中最突出、最令人难忘的自然是女主人公茶花女玛格丽特。读者们切莫把玛格丽特和阿尔丰西娜·普莱西小姐混为一谈..." ,
                    @"《汤姆叔叔的小屋》出版至今已有一百五十多年了。该书在1852年首次以单行本出版，立即获得巨大成功，第一周就销售一万册，当年就印行一百多次、三十五万册，这在..." ,
                    @"故事内容是平民出身的达达尼昂到巴黎投军，加入国王路易十三的火枪手卫队，和其他三个火枪手成为好朋友。他们为了保护王后奥地利的安妮的名誉，抗击红衣主教黎塞留，击败黎塞留设置的重重障碍，前往英国，从白金汉公爵那里取回王后的钻石，挫败了黎塞留挑拨国王和王后的阴谋。", nil];
    publishers = [[NSArray alloc] initWithObjects:@"南海出版公司",@"外国文学出版社",@"译林出版社",@"上海译文出版社", nil];
    ISBN = [[NSArray alloc] initWithObjects:@"9787544255080",@"9787501600069",@"9787806578513",@"9787532718214", nil];
    
    // 自定义首行 Cell 和其上导航栏的间距
//    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
//    _tableView.tableHeaderView.backgroundColor = [UIColor grayColor];
    
    // 隐藏   导航控制器的  导航栏
    self.navigationController.navigationBarHidden = YES;
    
//    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 640)];
    
    self.view.backgroundColor = [UIColor colorWithRed:129/255.0 green:163/255.0 blue:182/255.0 alpha:1];
    
    
}

#pragma mark-   
#pragma mark  UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 设置 分割线 的颜色 
//    [tableView setSeparatorColor:[UIColor blueColor]];
//    [tableView setSeparatorStyle:];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
       

        return [searchResults count];
     
    } else {

        return [namesOfBooks count];
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myCell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
//    cell.backgroundColor = [UIColor colorWithRed:173/255.0 green:218/255.0 blue:241/255.0 alpha:1];
//    cell.backgroundColor = [UIColor grayColor];
    
//    cell.contentView.backgroundColor = [UIColor grayColor];

//    UIImageView *cellView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundView.png"]];
//    cellView.contentMode = UIViewContentModeScaleToFill;
//    cell.backgroundView = cellView;
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {

        
        self.searchDisplayController.searchResultsTableView.frame = CGRectMake(10, 0, 300, 474);
        
        cell.label_1.text = [searchResults objectAtIndex:indexPath.row];
        cell.label_2.text = [introduction objectAtIndex:[namesOfBooks indexOfObject:cell.label_1.text]];
        
        cell.imageView.image = [UIImage imageNamed:[namesOfImages objectAtIndex:[namesOfBooks indexOfObject:cell.label_1.text]]];
        
    } else {

    // 为每个 cell 的 imageView 添加 image
    cell.imageView.image = [UIImage imageNamed:[namesOfImages objectAtIndex:indexPath.row]];
    cell.label_1.text = [namesOfBooks objectAtIndex:indexPath.row];
    cell.label_2.text = [introduction objectAtIndex:indexPath.row];
    
    }
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

// 筛选器  filter - 筛选  scope - 范围
-(void) filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope {
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd]%@", searchText];
    
    searchResults = [namesOfBooks filteredArrayUsingPredicate:resultPredicate];
    
    NSLog(@"筛选器方法已经运行。");
}

// 当搜索文本在被更改时，该方法会被自动调用，该方法由 UISearchDisplayController 类 提供
-(BOOL) searchDisplayController:(UISearchDisplayController *) controller shouldReloadTableForSearchString:(NSString *)searchString  {

    // ？？
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

// Segue 和 push 有何区别？
// Segue 包含 push , modal , popover 三种视图转换方式
//


-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchBooksDetailController *myViewDetailViewController = [[SearchBooksDetailController alloc] init];
    
    myViewDetailViewController.theRow = (int)indexPath.row;
    
    myViewDetailViewController.nameOfImages_detail = namesOfImages;
    
    myViewDetailViewController.writers_detail = writers;
    myViewDetailViewController.publishers_detail = publishers;
    myViewDetailViewController.introduction_detail = introduction;
    myViewDetailViewController.ISBN_detail = ISBN;
    
    if ([self.searchDisplayController isActive]) {


        myViewDetailViewController.searchDisplayControllerIsActive = YES;
        myViewDetailViewController.nameOfBooks_detail = searchResults;
        
        
        // 无效的操作 ， 在加载 xib 的 viewDidLoad： 方法被调用之前，所有 xib 上的 IBOutlet 都为 nil , 所以对这些 空指针操作无意义
//        myViewDetailViewController.nameOfBook.text = [searchResults objectAtIndex:indexPath.row];
//        myViewDetailViewController.imageView.image = [UIImage imageNamed:[namesOfImages objectAtIndex:indexPath.row]];
//        NSLog(@"self.searchDisplayController isActive");

        NSLog(@"%@", myViewDetailViewController.nameOfBook.text);
        
    } else {

        myViewDetailViewController.searchDisplayControllerIsActive = NO;
        myViewDetailViewController.nameOfBooks_detail = namesOfBooks;
        
    }
    
    [[self navigationController] pushViewController:myViewDetailViewController animated:YES];
    
    
}

// 必须对新建立的UILabel 接口进行内存的分配，不然 定义出来的就是一个空的指针， 对其赋值无效。


@end
