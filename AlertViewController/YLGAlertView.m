//
//  YLGAlertView.m
//  AlertViewController
//
//  Created by 杨林贵 on 17/4/21.
//  Copyright © 2017年 杨林贵. All rights reserved.
//

#import "YLGAlertView.h"
#define  IOS7  [[UIDevice currentDevice].systemVersion floatValue] < 8.0
@interface YLGAlertView ()<UIAlertViewDelegate,UIActionSheetDelegate>
@end

@implementation YLGAlertView

-(id)initWithTitle:(NSString *)title message:(NSString *)message otherTitles:(NSArray *)otherTitles cancelBtnTitle:(NSString *)cancelTitle destructiveBtnTitle:(NSString *)destructiveTitle styleType:(YLGAlertViewStyle)style controller:(UIViewController *)controller clickBlock:(AlertViewBlock)block
{
    
    self = [super init];
     if (self) {
         self.clickBlock = block;
         self.showOnVc = controller;
        if (IOS7) {
            NSString *sureTitle1 = nil;
            NSString *sureTitle2 = nil;
            NSString *sureTitle3 = nil;
            if (otherTitles.count >=1) {
                sureTitle1 = otherTitles[0];
            }
            if (otherTitles.count >=2){
                sureTitle2 = otherTitles[1];
            }
            if (otherTitles.count >=3){
                sureTitle3 = otherTitles[2];
            }
            
            if (style == YLGAlertViewStyleAlert) {
                UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:sureTitle1,sureTitle2,sureTitle3,destructiveTitle, nil];
                [alertV show];
            }else{
                
                UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:destructiveTitle otherButtonTitles:sureTitle1,sureTitle2,sureTitle3,nil];
                [actionSheet showInView:controller.view];
            }
        }else{
            UIAlertControllerStyle alertControllerStyle = UIAlertControllerStyleAlert;
            if (style == YLGAlertViewStyleActionSheet) {
                alertControllerStyle = UIAlertControllerStyleActionSheet;
            }
            self.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];
            for (int i = 0; i<otherTitles.count; i++) {
                [self alertActionTitle:otherTitles[i] alertActionStyle:UIAlertActionStyleDefault];
            }
            [self alertActionTitle:cancelTitle alertActionStyle:UIAlertActionStyleCancel];
            [self alertActionTitle:destructiveTitle alertActionStyle:UIAlertActionStyleDestructive];
            
            [self.showOnVc presentViewController:self.alertController animated:YES completion:nil];

        }
    }
    return self;
}
-(void)alertActionTitle:(NSString *)title alertActionStyle:(UIAlertActionStyle)style{
    if (title == nil || [title isEqualToString:@""]) {
        return;
    }
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
        if (self.clickBlock) {
            self.clickBlock(action.title);
        }
    }];
    [self.alertController addAction:alertAction];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.clickBlock) {
        self.clickBlock([NSString stringWithFormat:@"iOS7_%@",[alertView buttonTitleAtIndex:buttonIndex]]);
    }
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.clickBlock) {
        self.clickBlock([NSString stringWithFormat:@"iOS7_%@",[actionSheet buttonTitleAtIndex:buttonIndex]]);
    }
}
@end
