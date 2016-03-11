//
//  tableviewCellTableViewCell.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/25.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "tableviewCellTableViewCell.h"



@implementation tableviewCellTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _title = [[UILabel alloc] initWithFrame:CGRectMake(12, 5, self.bounds.size.width, 40)];
    _title.numberOfLines = 2;
    _author = [[UILabel alloc] initWithFrame:CGRectMake(12, 45, self.bounds.size.width, 10)];
    
    _author.textColor = [UIColor grayColor];

    
    
    if (self) {
    
        _title.font = [UIFont boldSystemFontOfSize:12.0f];
        _author.font = [UIFont boldSystemFontOfSize:10.0f];
        [self addSubview:_title];
        [self addSubview:_author];
        
       
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
