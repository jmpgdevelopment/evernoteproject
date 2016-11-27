//
//  NoteDetailsVC.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 27/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "NoteDetailsVC.h"

@interface NoteDetailsVC ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIWebView *noteDetailWebView;

@end

@implementation NoteDetailsVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self configView];
}

#pragma mark -  Private methods

- (void)configView  {

    self.navigationItem.title = NSLocalizedString(@"noteDetails", @"noteDetails");
    [self configTitleView];
    [self loadWebDataFromNote:self.note];
}

- (void)configTitleView {

    self.titleLabel.text = self.note.title;
    NSLog(@"NOTE DETAILS : %@, ", self.note.content);
}

- (void)loadWebDataFromNote:(ENNote *)note   {

    [note generateWebArchiveData:^(NSData *data) {
        [self.noteDetailWebView loadData:data
                      MIMEType:ENWebArchiveDataMIMEType
              textEncodingName:nil
                       baseURL:nil];
    }];
}


@end
