//
//  XCFAttrsCell.m
//  XCF第一波
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFAttrsCell.h"


@interface XCFAttrsCell ()

@end
@implementation XCFAttrsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = XCFGlobalBackgroundColor;
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_label];
        _label.numberOfLines = 0;
    }
    return self;
}
- (void)setAttrs:(NSDictionary *)attrs {
    _attrs = attrs;
    NSString *name=[attrs objectForKey:@"name"];
    NSString *value=[attrs objectForKey:@"value"];
    
    self.label.text = [NSString stringWithFormat:@"%@：%@",name, value];
    self.label.frame = CGRectMake(15, 10, KScreenWidth-30, 30);
}

@end
