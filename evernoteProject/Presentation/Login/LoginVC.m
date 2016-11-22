//
//  LoginVC.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 21/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "LoginVC.h"
#import <evernote-cloud-sdk-ios/ENSDK.h>
#import <evernote-cloud-sdk-ios/ENSession.h>

@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginVC

#pragma mark - UIViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self configView];
}

#pragma mark - Private methods

- (void)configView  {

    self.navigationController.title = @"Login";
}

#pragma mark - UI Actions

- (IBAction)LoginAction:(id)sender {

    if ([[ENSession sharedSession] isAuthenticated]) {
        [[ENSession sharedSession] unauthenticate];
    } else {
        [[ENSession sharedSession] authenticateWithViewController:self
                                               preferRegistration:NO
                                                       completion:^(NSError *authenticateError) {
                                                           if (!authenticateError) {
                                                               [self showSuccess];
                                                           } else if (authenticateError.code != ENErrorCodeCancelled) {
                                                               [self showMessage:@"The user couldn't be authenticated!"];
                                                           }
                                                       }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
