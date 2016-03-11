//
//  NewSubmitViewController.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/27.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "NewSubmitViewController.h"
#import "tableviewCellTableViewCell.h"
#import "HttpRequest.h"

#import "Json.h"

#import "ViewController.h"





@interface NewSubmitViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong
          ) UITableView *tableview;



@property(nonatomic,copy
          ) NSArray *deserialized ;

@property(nonatomic,strong
          ) ViewController *viewController;

@end



@implementation NewSubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _deserialized = [[NSArray alloc] init];
    
    
     _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
   
    self.tableview.delegate = self;
     self.tableview.dataSource = self;

    
    [self.view addSubview:_tableview];
    
    
    
    // Do any additional setup after loading the view.
}


-(void)request:(NSString *)url{
    
    [[HttpRequest instance]httprequest:url compilete:^(NSData *string) {
        
        
        
        [[Json instance] dataConvertJson:string complete:^(id data) {
            
            if (data != nil ) {
                
                
                if ([data isKindOfClass:[NSDictionary class]]) {
                    
                }else if ([data isKindOfClass:[NSArray class]]){
                    _deserialized = (NSArray *)data;
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableview reloadData];
                    });
                }
            }
            
        }];
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return _deserialized.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    tableviewCellTableViewCell *cell = (tableviewCellTableViewCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[tableviewCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    NSDictionary *dic = (NSDictionary*)[_deserialized objectAtIndex:indexPath.row];
    cell.title.text = [dic objectForKey:@"title"];

    cell.author.text = [dic objectForKey:@"author"];
    
    return cell;

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSDictionary *dic = (NSDictionary*)[_deserialized objectAtIndex:indexPath.row];
    [_delegate click:[dic objectForKey:@"link"]];

}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
@end
