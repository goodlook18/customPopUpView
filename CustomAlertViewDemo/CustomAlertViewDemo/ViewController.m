
//
//  ViewController.m
//  CustomAlertViewDemo
//
//  Created by cmcc on 16/3/8.
//  Copyright © 2016年 kanzongting. All rights reserved.
//

#import "ViewController.h"
#import "KZTAlertView.h"
#import "DPPopUpView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)popUp:(UIButton *)sender {
    KZTAlertView *alertView = [[KZTAlertView alloc]initWithTitle:@"返回的结果" leftButtonTitle:@"重试" rightButtonTitle:@"忘记密码"];
    //    alertView.delegate = self;
    [alertView show];
}

- (IBAction)originalAlert:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"返回的结果" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"重试" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    UIAlertAction *forgetAction = [UIAlertAction actionWithTitle:@"忘记密码" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:forgetAction];
//    alert.view.tintColor = [UIColor yellowColor];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
