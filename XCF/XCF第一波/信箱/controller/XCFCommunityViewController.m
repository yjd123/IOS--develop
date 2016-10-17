

#import "XCFCommunityViewController.h"
#import "XCFForumViewCell.h"
#import "XCFForum.h"
#import "XCFAuthor.h"
#import "XCFTopicViewController.h"

@interface XCFCommunityViewController ()

@end

@implementation XCFCommunityViewController

static NSString *const reuseIdentifier = @"forumCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"社区";
    
    [self setupTableView];
    [self addFeedbackButton];
    [self loadNewData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XCFForumViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (indexPath.row == 0) cell.forum = self.forums;
    if (indexPath.row == 1) cell.forum = self.shouts;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        XCFTopicViewController *top=[[XCFTopicViewController alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:top];
        [self.navigationController presentViewController:nav animated:YES completion:NULL];
        
    }
}


#pragma mark - 网络请求

- (void)loadNewData {
    [[AFHTTPSessionManager manager] GET:XCFRequestCommunity
                             parameters:nil
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    
                                    self.forums = [XCFForum mj_objectWithKeyValues:responseObject[@"content"][@"forums"][0]];
                                    
                                    self.shouts = [XCFForum mj_objectWithKeyValues:responseObject[@"content"][@"shouts"]];
                                    
                                    [self.tableView reloadData];
                                    [self.tableView.mj_header endRefreshing];
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    [self.tableView.mj_header endRefreshing];
                                }];
}


#pragma mark - 属性

- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = XCFGlobalBackgroundColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 80;
    [self.view addSubview:tableView];
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XCFForumViewCell class]) bundle:nil]forCellReuseIdentifier:reuseIdentifier];
    
    self.tableView = tableView;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
}

- (void)addFeedbackButton {
    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"notification"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    
}



-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}




#pragma mark - 事件处理

- (void)feedback {
    
}

- (void)notification {
    
}

@end
