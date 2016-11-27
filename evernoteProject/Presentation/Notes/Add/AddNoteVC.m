//
//  AddNoteVC.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 27/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "AddNoteVC.h"
#import "AppDependencies.h"

@interface AddNoteVC ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textContentTextView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic, strong) NSArray *itemsArray;

@end

@implementation AddNoteVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self configView];
}

- (void)configView  {

    self.navigationItem.title = NSLocalizedString(@"newNote", @"newNote");
    [self configTitleLabel];
    [self configContentLabel];
}

- (void)configTitleLabel    {
    self.titleLabel.text = NSLocalizedString(@"title", @"title");
}

- (void)configContentLabel  {
    self.contentLabel.text = NSLocalizedString(@"content", @"content");
}

- (IBAction)saveAction:(id)sender {

    ENNote *note = [[ENNote alloc] init];
    note.title = self.titleTextField.text;
    note.content = [ENNoteContent noteContentWithString:self.textContentTextView.text];
    if(note.content && note.title)  {
        [[AppDependencies sharedInstance].notesUseCases createNote:note success:^(ENNoteRef *noteRef) {
            [self dismissViewControllerAnimated:YES completion:^{
                [self.delegate refreshNotes:nil didFinishAddingNote:(NSUInteger *)ENSessionSortOrderRecentlyCreated];
            }];
        } failure:^(NSError *error) {
            [self showError:error];
        }];
    } else {
        [self cancelAction:nil];
    }
}

- (IBAction)cancelAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
