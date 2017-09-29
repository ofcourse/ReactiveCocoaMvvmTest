//
//  TestTableviewViewController.m
//  ReactiveCocoaMvvmTest
//
//  Created by hsg on 2017/9/28.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "TestTableviewViewController.h"
#import "TestSelfSizeTableViewCell.h"

@interface TestTableviewViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)  NSArray *datas;
@end

@implementation TestTableviewViewController
//http://www.thomashanning.com/uitableview-automatic-row-height/
- (NSArray *)datas {
    return @[@"this is short text",@"this is short textthis is short textthis is short textthis is short textthis is short textthis is short textthis is short textthis is short textthis is short textthis is short textthis is short text",@"this is short text2",@"go"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestSelfSizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tid" forIndexPath:indexPath];
    cell.lblText.text = self.datas[indexPath.row] ;
    //lable line break  setting  word wrap & line to 0
    return cell;
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
