//
//  DPPopUpView.h
//  dataplus
//
//  Created by cmcc on 15/12/2.
//  Copyright © 2015年 CMITHZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DPPopUpViewDelegate;

@interface DPPopUpView : UIView
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImage *icon;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *message;
@property (weak, nonatomic) id<DPPopUpViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon message:(NSString *)message delegate:(id<DPPopUpViewDelegate>)delegate buttonTitles:(NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION;

// Show the alert view in current window
- (void)show;

// Hide the alert view
- (void)hide;

// Set the color and font size of title, if color is nil, default is black. if fontsize is 0, default is 14
- (void)setTitleColor:(UIColor *)color fontSize:(CGFloat)size;

// Set the color and font size of message, if color is nil, default is black. if fontsize is 0, default is 12
- (void)setMessageColor:(UIColor *)color fontSize:(CGFloat)size;

// Set the color and font size of button at the index, if color is nil, default is black. if fontsize is 0, default is 16
- (void)setButtonTitleColor:(UIColor *)color fontSize:(CGFloat)size atIndex:(NSInteger)index;

@end

@protocol DPPopUpViewDelegate <NSObject>

- (void)alertView:(DPPopUpView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

