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

@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginButtonItem;
@property (weak, nonatomic) IBOutlet UIButton *notesButton;

@end

@implementation LoginVC 

#pragma mark - UIViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"login", @"login");
    [self configView];
}

#pragma mark - Private methods

- (void)configView  {

    [self configLoginButton];
    [self configNotesButton];
}

- (void)configLoginButton   {

    self.loginButtonItem.title = [[ENSession sharedSession] isAuthenticated] ? @"Logout" : @"login";
}

- (void)configNotesButton   {

    self.notesButton.titleLabel.text = NSLocalizedString(@"notes", @"notes");
    self.notesButton.hidden = ![[ENSession sharedSession] isAuthenticated];
}

#pragma mark - UI Actions

- (IBAction)LoginAction:(id)sender {

    if ([[ENSession sharedSession] isAuthenticated]) {
        [[ENSession sharedSession] unauthenticate];
        [self configLoginButton];
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
