//
//  BaseTableVC.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 25/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableVC : UITableViewController

- (void)showLoading;
- (void)dismissLoading;
- (void)showMessage:(NSString *)message;
- (void)showSuccess;
- (void)showError:(NSError *)error;

@end
