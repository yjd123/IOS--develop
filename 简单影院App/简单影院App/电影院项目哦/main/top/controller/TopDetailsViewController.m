

#import "TopDetailsViewController.h"
#import "MovieCommonData.h"
#import "UIImageView+WebCache.h"
#import "TopDetailsCell.h"
#import "TopModel.h"

@interface TopDetailsViewController ()

@end

@implementation TopDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    self.title=@"电影详情";
    [self loadData];
    [self loadData1];
    [self creatCollection];
    [self creatTableView];
    self.navigationController.navigationBar.translucent = NO;
    
    _headView.backgroundColor=[UIColor clearColor];
    
}

-(void)creatTableView{
    _table.backgroundColor=[UIColor clearColor];
    _table.delegate=self;
    _table.dataSource=self;
   
    
}

-(void)loadData1{
    _arr=[NSMutableArray array];
    NSDictionary *dic1=(NSDictionary *)[MovieCommonData requestData:@"movie_comment.json"];
    NSArray *array=[dic1 objectForKey:@"list"];
    for (NSDictionary *dic in array) {
        TopModel *model=[[TopModel alloc]init];
        model.userImage=[dic objectForKey:@"userImage"];
        model.nickname=[dic objectForKey:@"nickname"];
        model.rating=[dic objectForKey:@"rating"];
        model.content=[dic objectForKey:@"content"];
        [_arr addObject:model];
    }
    [_table reloadData];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
//    if (!cell) {
       UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
       
        _headPicture=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
       
        _name=[[UILabel alloc]initWithFrame:CGRectMake(70, 5, 200, 25)];
        _name.textColor=[UIColor blueColor];
      
        _score=[[UILabel alloc]initWithFrame:CGRectMake(280, 5, 40, 20)];
        _score.textColor=[UIColor redColor];
    
        _content=[[UILabel alloc]initWithFrame:CGRectMake(70, 35, 233, 60)];
        _content.backgroundColor=[UIColor clearColor];
       
        _content.textColor=[UIColor whiteColor];
        _content.numberOfLines=0;
        _content.font=[UIFont systemFontOfSize:13];
        [cell.contentView addSubview:_headPicture];
        [cell.contentView addSubview:_name];
        [cell.contentView addSubview:_score];
        [cell.contentView addSubview:_content];
    
    
    cell.backgroundColor=[UIColor clearColor];
    TopModel *model=[_arr objectAtIndex:indexPath.row];
    _text=model.content;
     _content.text=_text;
    NSURL *url=[NSURL URLWithString:model.userImage];
    
    [_headPicture sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    _name.text=model.nickname;
    _score.text=[NSString stringWithFormat:@"%.1f",[model.rating floatValue]];
  
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
 
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    TopModel *model=[_arr objectAtIndex:indexPath.row];
//    _text=model.content;
    CGRect rect=[_text boundingRectWithSize:CGSizeMake(241, 100000)
                                   options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
   
    
    CGRect frame=_content.frame;
    frame.size.height=rect.size.height;
    _content.frame=frame;
    
    CGRect frame1=_headPicture.frame;
    frame1.origin.y=(rect.size.height+65)/2-25;
    _headPicture.frame=frame1;
    
    
    return rect.size.height+65;
    
}

-(void)creatCollection{
    _collection.backgroundColor=[UIColor clearColor];
    _collection.delegate=self;
    _collection.dataSource=self;
      
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopDetailsCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"topDetailsCell" forIndexPath:indexPath];
    cell.picture=_images[indexPath.item];
    return cell;
}


-(void)loadData{
    NSDictionary *dic=(NSDictionary *)[MovieCommonData requestData:@"movie_detail.json"];
    NSString *image=[dic objectForKey:@"image"];
    _images=[dic objectForKey:@"images"];
    
    NSString *movieName=[dic objectForKey:@"titleCn"];
    NSArray *director=[dic objectForKey:@"directors"];
    NSString *director1=[director objectAtIndex:0];
    NSArray *actors=[dic objectForKey:@"actors"];
     _str=[NSMutableString stringWithString:@""];
    _str1=[NSMutableString stringWithString:@""];
    for (NSString *actors1 in actors) {
       
        [_str appendString:actors1];
    }
    NSArray *types=[dic objectForKey:@"type"];
    for (NSString *types1 in types) {
        
        [_str1 appendString:types1];
    }
    NSString *years=[[dic objectForKey:@"release"]objectForKey:@"location"];
    NSString *date=[[dic objectForKey:@"release"]objectForKey:@"date"];
    _year.text=years;
    _movieTime.text=date;
    _movieType.text=[NSString stringWithFormat:@"类型:%@",_str1];
    _movieStar.text=[NSString stringWithFormat:@"主演:%@",_str];
    _directorName.text=director1;
    _movieName.text=movieName;
    [_pictureImageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
