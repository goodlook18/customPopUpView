//
//  OPPAlertView.h
//  UI
//
//  Created by goodlook on 16/1/9.
//  Copyright © 2016年 CMITHZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPPopUpView.h"

#define kALERT_VIEW_ACTION_OUT_OF_DATE              10090

@class KZTAlertView;

@protocol  OTTAlertViewDelegate <NSObject>
- (void)alertView:(KZTAlertView *)promptAlertView selectButtonIndex:(NSInteger)buttonIndex;
@end

@interface KZTAlertView : UIView
@property (nonatomic, assign) id<OTTAlertViewDelegate>  delegate;

/*!@brief 上部提示信息 下部一左一右两个按钮
 * @param <#@param#>
 */
- (id)initWithTitle:(NSString *)title leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rightTitle;

- (void)show;

@end
