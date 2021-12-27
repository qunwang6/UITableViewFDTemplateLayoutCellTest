//
//  ViewController.m
//  tableViewTest
//
//  Created by qun on 2021/12/27.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "Model.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController{
    NSMutableArray *_allDataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self initailData];
    [self createMianViews];
}

- (void)initailData{
    _allDataArr = [NSMutableArray array];
    /**
     *  虚拟数据
     */
    for (NSInteger i = 0; i < 3; i++) {
        Model *model = [Model new];
        model.text = @"在东方世界里，挑选小公牛到竞技场角斗有一定的程序。每一头被带进场地的公牛都要向手持长矛刺它的斗牛士发起进攻。其勇敢程度是根据它不顾矛刃的刺痛向斗牛士进攻的次数来认真评定的";
        [_allDataArr addObject:model];
    }
}

- (void)createMianViews{
    UITableView *myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    myTableView.backgroundColor = [UIColor whiteColor];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.fd_debugLogEnabled = YES;       //打开自适应高度debug模式
    [self.view addSubview:myTableView];
    [myTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = (MyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [self setupModelOfCell:cell AtIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allDataArr.count;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(id cell) {
        [self setupModelOfCell:cell AtIndexPath:indexPath];
    }];
}

#warning -重点(自适应高度必须实现)
//预加载Cell内容
- (void)setupModelOfCell:(MyTableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath{
    cell.model = [_allDataArr objectAtIndex:indexPath.row];
}
@end
