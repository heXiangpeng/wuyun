//
//  KnowlegeViewControllViewController.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/26.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "KnowlegeViewControllViewController.h"
#import "tableviewCellTableViewCell.h"
#import "HttpRequest.h"
#import "SercritPager.h"
#import "MMMarkdown.h"
#import "Json.h"

#import "XmlPaser.h"
#import "KnowlgeViewController.h"


@interface KnowlegeViewControllViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableview;

@property(nonatomic,strong) NSArray *array;
@property(nonatomic,copy) KnowlgeViewController *knowlge;

@end

@implementation KnowlegeViewControllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    _array = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    
    
    [self.view addSubview:_tableview];
    
    _tableview.dataSource = self;
    _tableview.delegate = self;
 
    
    
    [[HttpRequest instance]httprequest:@"http://drops.wooyun.org/feed" compilete:^(NSData *string) {
        
        [[XmlPaser instance] dataToXml:string complite:^(NSMutableArray *array) {
            NSLog(@"个数是214：%lu",(unsigned long)array.count);
            _array = [array mutableCopy];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableview reloadData];
                
                
            });
            
            
        }];
        
        
    }];
    
    
    
    
}

- (NSString *)removeSomeCharact:(NSString *)text{
    text = [text stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return text;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _array.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableviewCellTableViewCell *cell = [[tableviewCellTableViewCell alloc] init];
    SercritPager *page = (SercritPager*)[_array objectAtIndex:indexPath.row];
    
    cell.title.text = [self removeSomeCharact:page.title];
    cell.author.text = [self removeSomeCharact:page.creator];;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
       _knowlge = [[KnowlgeViewController alloc] init];
    
    SercritPager *page = (SercritPager*)[_array objectAtIndex:indexPath.row];
    
    
    
    
    
    [self.navigationController pushViewController:_knowlge animated:true ];
    _knowlge.text = [page.content copy];
    _knowlge.navtitle = [self removeSomeCharact:page.title];
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
