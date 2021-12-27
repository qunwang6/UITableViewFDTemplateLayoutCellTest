//
//  MyTableViewCell.m
//  tableViewTest
//
//  Created by qun on 2021/12/27.
//



#import "MyTableViewCell.h"
#import "Masonry.h"
@implementation MyTableViewCell{
    UILabel *_textLB;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
/**
 *  注意,不管布局多复杂,一定要有相对于cell.contentView的bottom的约束
 */
- (void)createSubViews{
    _textLB = [UILabel new];
    _textLB.backgroundColor = [UIColor orangeColor];
    _textLB.numberOfLines = 0;
    [self.contentView addSubview:_textLB];
    [_textLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
        make.bottom.right.equalTo(self.contentView).offset(-10);
    }];
}
/**
 *  赋值
 *
 *  @param model ViewController传递过来的Model用来赋值
 */
- (void)setModel:(Model *)model{
    if (_model != model) {
        _model = model;
        _textLB.text = [NSString stringWithFormat:@"%@", model.text];
    }
}
@end
