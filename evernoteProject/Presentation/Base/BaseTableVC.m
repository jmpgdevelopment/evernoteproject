//
//  BaseTableVC.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 25/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "BaseTableVC.h"
#import <JGProgressHUD/JGProgressHUD.h>

@interface BaseTableVC ()

@property (nonatomic, strong) JGProgressHUD *HUD;

@end

@implementation BaseTableVC

- (void)viewDidLoad {

    [super viewDidLoad];
    self.HUD = [[JGProgressHUD alloc] init];
}

#pragma mark - UI Messages

- (void)showLoading {

    self.HUD.textLabel.text = NSLocalizedString(@"loading", @"loading");
    [self.HUD showInView:self.view];
}

- (void)dismissLoading  {

    [self.HUD dismiss];
}

- (void)showMessage:(NSString *)message {

    self.HUD.textLabel.text = message;
    [self.HUD showInView:self.view];
    [self.HUD dismissAfterDelay:3.0];
}

- (void)showSuccess {

    self.HUD.indicatorView = [[JGProgressHUDPieIndicatorView alloc] initWithHUDStyle:self.HUD.style];
    [self.HUD showInView:self.view];
    [self.HUD dismissAfterDelay:3.0];
}

- (void)showError:(NSError *)error  {

    self.HUD.textLabel.text = NSLocalizedString(@"error", @"error");
    self.HUD.indicatorView = [[JGProgressHUDPieIndicatorView alloc] init];
    [self.HUD showInView:self.view];
    [self.HUD dismissAfterDelay:3.0];
}

@end
