//
//  BaseVC.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 21/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController

- (void)showLoading;
- (void)dismissLoading;
- (void)showMessage:(NSString *)message;
- (void)showSuccess;
- (void)showError:(NSError *)error;

@end
