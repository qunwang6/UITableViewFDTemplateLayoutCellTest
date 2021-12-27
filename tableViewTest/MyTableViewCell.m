//
//  MyTableViewCell.m
//  tableViewTest
//
//  Created by qun on 2021/12/27.
//



#import "MyTableViewCell.h"
#import "Masonry.h"
#define CFFlexibleWidth(c) (c/375.0*UIScreen.mainScreen.bounds.size.width)

@interface MyTableViewCell ()
@property (nonatomic, strong) UILabel *textLB;
@property (nonatomic, strong) UIImageView* goodsImageView;

@end
@implementation MyTableViewCell

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
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.equalTo(_textLB);
        //make.bottom.right.equalTo(self.contentView).offset(-100);
    }];
    
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.image = [UIImage imageNamed:@"default"];
    _goodsImageView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_goodsImageView];
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textLB.mas_bottom).offset(13);
        make.left.mas_equalTo(CFFlexibleWidth(13));
        make.width.mas_equalTo(CFFlexibleWidth(50));
        make.height.mas_equalTo(CFFlexibleWidth(50));
        make.bottom.equalTo(self.contentView).offset(-10);
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
