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

@property (weak, nonatomic) IBOutlet UIBarButtonItem *LoginButtonItem;

@end

@implementation LoginVC

#pragma mark - UIViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self configView];
}

#pragma mark - Private methods

- (void)configView  {

    self.title = @"LOGIN";
    [self configLoginButton];
}

- (void)configLoginButton   {

    self.LoginButtonItem.title = [[ENSession sharedSession] isAuthenticated] ? @"Logout" : @"login";
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

@end
