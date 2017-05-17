//
//  YLGAlertView.h
//  AlertViewController
//
//  Created by 杨林贵 on 17/4/21.
//  Copyright © 2017年 杨林贵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^AlertViewBlock)(NSString *);

typedef NS_ENUM(NSInteger,YLGAlertViewStyle){
    YLGAlertViewStyleAlert = 0,
    YLGAlertViewStyleActionSheet
};
@interface YLGAlertView : NSObject
@property (nonatomic, readonly) YLGAlertViewStyle style;
@property(nonatomic,strong)UIAlertController *alertController;
@property(nonatomic,copy)AlertViewBlock clickBlock;
@property(nonatomic,strong)UIViewController *showOnVc;

-(id)initWithTitle:(NSString *)title message:(NSString *)message otherTitles:(NSArray *)otherTitles cancelBtnTitle:(NSString *)cancelTitle destructiveBtnTitle:(NSString *)destructiveTitle styleType:(YLGAlertViewStyle)style controller:(UIViewController *)controller clickBlock:(AlertViewBlock)block;

@end
