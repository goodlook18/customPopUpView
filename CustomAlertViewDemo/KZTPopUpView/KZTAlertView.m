//
//  OPPAlertView.m
//  UI
//
//  Created by goodlook on 16/1/9.
//  Copyright © 2016年 CMITHZ. All rights reserved.
//
//
//颜色
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 背景色
#define bgcor1 UIColorFromRGB(0x4285f4)
#define bgcor2 UIColorFromRGB(0xdcdcdc)
#define bgcor3 UIColorFromRGB(0xededed)
// 文字色
#define cor1 UIColorFromRGB(0x333333)
#define cor2 UIColorFromRGB(0x666666)
#define cor3 UIColorFromRGB(0x999999)
#define cor4 UIColorFromRGB(0xbbbbbb)
#define cor5 UIColorFromRGB(0xffffff)
#define cor6 UIColorFromRGB(0x408af4)


#import "KZTAlertView.h"
#import "DPPopUpView.h"

@interface KZTAlertView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *closeViewButton;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, strong) NSString *rightTitle;
@property (nonatomic, assign) CGRect  titleRect;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightBUtton;
@property (nonatomic, strong) UIButton *centerButton;

@end


@implementation KZTAlertView

- (id)initWithTitle:(NSString *)title leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rightTitle{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.f;
        self.layer.masksToBounds = YES;
        
        self.title = title;
        self.leftTitle = leftTitle;
        self.rightTitle = rightTitle;
        
        self.titleRect = [self.title boundingRectWithSize:CGSizeMake(225-20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        
        self.frame = CGRectMake(0, 0, 225, self.titleRect.size.height+72);
        
        [self addTitleLabel];
        [self labelLineView];
        [self addLeftButton];
        [self addRightBUtton];
        [self addButtonlineView];
    }
    return self;
}

- (id)initWithTitle:(NSString *)title  {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.f;
        self.layer.masksToBounds = YES;
        self.title = title;
        self.titleRect = [self.title boundingRectWithSize:CGSizeMake(225-20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        self.frame = CGRectMake(0, 0, 225, self.titleRect.size.height+82);
        [self addTitleLabel];
        [self addCenterButton];
    }
    return self;
}

-(void)show {
    DPPopUpView *popupView = [[DPPopUpView alloc]init];
    popupView.contentView = self;
    [popupView show];
}

/********    !@brief 创建加载提示信息文字视图  ***********
 */
- (void)addTitleLabel {
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, self.frame.size.width-40, self.titleRect.size.height)];
    label.text = self.title;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = cor1;
    label.font = [UIFont systemFontOfSize:14];
    _titleLabel = label;
    [self addSubview:_titleLabel];
    
}

/********    !@brief 创建加载文字与按钮的分割线  ***********
 */
- (void)labelLineView {
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, _titleLabel.frame.origin.y+_titleLabel.frame.size.height+20, self.frame.size.width, 1)];
    lineView.backgroundColor = bgcor2;
    [self addSubview:lineView];
}

/********    !@brief 创建加载下部中间的 好的 按钮  ***********
 */
- (void)addCenterButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.center = CGPointMake(_titleLabel.center.x, self.frame.size.height-35);
    button.bounds = CGRectMake(0, 0, 90, 30);
    
    [button setBackgroundImage:[UIImage imageNamed:@"UniPayRedpacket.bundle/btn_haode_nm"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"UniPayRedpacket.bundle/btn_haode-_PRE"] forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _centerButton = button;
    [self addSubview:_centerButton];
}

/********    !@brief 创建加载下部左边的按钮  ***********
 */
- (void)addLeftButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, _titleLabel.frame.origin.y+_titleLabel.frame.size.height+21, self.frame.size.width/2-0.5, 31);
    [button setTitleColor:bgcor1 forState:UIControlStateNormal];
    [button setTitle:self.leftTitle forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _leftButton = button;
    [self addSubview:_leftButton];
}

/********    !@brief 创建加载下部右边的视图  ***********
 */
- (void)addRightBUtton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.frame.size.width/2+0.5, _titleLabel.frame.origin.y+_titleLabel.frame.size.height+21, self.frame.size.width/2-0.5, 31);
    [button setTitleColor:bgcor1 forState:UIControlStateNormal];
    [button setTitle:self.rightTitle forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1;
    _rightBUtton = button;
    [self addSubview:_rightBUtton];
}
/********    !@brief 创建加载下部两个按钮之间的间隔线  ***********
 */
- (void)addButtonlineView {
    UIView *lineView = [[UIView alloc]init];
    lineView.center = CGPointMake(_leftButton.frame.size.width+0.5, _leftButton.center.y);
    lineView.bounds = CGRectMake(0, 0, 1, 31);
    lineView.backgroundColor = bgcor2;
    [self addSubview:lineView];
}

#pragma mark - 点击按钮
- (void)buttonClick:(UIButton *)button {
    [self removeView];
    if ([_delegate respondsToSelector:@selector(alertView:selectButtonIndex:)]) {
        [_delegate alertView:self selectButtonIndex:button.tag];
    }
    
}

#pragma mark - 移除视图
- (void)removeView {
    DPPopUpView *popUpView = (DPPopUpView *)self.superview;
    [popUpView hide];
}


@end
