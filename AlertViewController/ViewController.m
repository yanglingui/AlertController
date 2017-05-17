//
//  ViewController.m
//  AlertViewController
//
//  Created by 杨林贵 on 17/1/10.
//  Copyright © 2017年 杨林贵. All rights reserved.
//

#import "ViewController.h"
#import "YLGAlertView.h"
@interface ViewController ()<UIActionSheetDelegate>
@property(nonatomic,strong)UIAlertController *alertVc;
@property(nonatomic,strong)YLGAlertView *alertV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIAlertControllerStyleAlert :alertView
    //UIAlertControllerStyleActionSheet :actionSheet
}
- (IBAction)showAlertView:(id)sender {
    //注意在使用的时候一定要把YLGAlertView设置为全局变量，否则的话YLGAlertView中的代理无法执行。
    YLGAlertView *alertVi = [[YLGAlertView alloc] initWithTitle:@"AlertViewTitle" message:@"message" otherTitles:@[@"确定"] cancelBtnTitle:@"取消" destructiveBtnTitle:nil styleType:YLGAlertViewStyleAlert controller:self clickBlock:^(NSString *title) {
         NSLog(@"%@",title);
     }];
     self.alertV = alertVi;
}

- (IBAction)showActionSheet:(id)sender {
    //注意在使用的时候一定要把YLGAlertView设置为全局变量。
    YLGAlertView *alertVi = [[YLGAlertView alloc] initWithTitle:@"请选择照片" message:nil otherTitles:@[@"从相册选择",@"拍照",@"小视屏"] cancelBtnTitle:@"取消" destructiveBtnTitle:@"删除" styleType:YLGAlertViewStyleActionSheet controller:self clickBlock:^(NSString *title) {
        NSLog(@"%@",title);
    }];
    self.alertV = alertVi;
}
@end
