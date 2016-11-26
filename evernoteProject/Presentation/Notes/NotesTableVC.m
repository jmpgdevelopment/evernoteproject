//
//  NotesTableVC.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 25/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "NotesTableVC.h"
#import <evernote-cloud-sdk-ios/ENSDK.h>
#import <evernote-cloud-sdk-ios/EDAMNoteStore.h>
#import "AppDependencies.h"
#import "NoteTVCell.h"
#import "NotesFilterModalTVC.h"

@interface NotesTableVC ()

@property (nonatomic, strong) ENNoteSearch *noteSearch;
@property (nonatomic, strong) ENNotebook *notebook;
@property (nonatomic, strong) NSArray *notesArray;
@property (nonatomic, strong) NSArray *notebooksArray;
@property (nonatomic, strong) NSError *error;

@end

@implementation NotesTableVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self configView];
    self.sortOrder = (NSUInteger *)ENSessionSortOrderTitle;
}

- (void)configView  {

    self.navigationItem.title = NSLocalizedString(@"notes", @"notes");
    [self configNotesTV];
}

#pragma mark Private methods

- (void)configNotesTV  {

    [self getNotebooksArray];
    [self getNotesArrayFromNotebook:self.notebooksArray[0] sortOrder:self.sortOrder];
}

- (void)getNotebooksArray	{

    [self showLoading];
    [[AppDependencies sharedInstance].notesUseCases getNotebooksWithSuccess:^(NSArray *notebooks) {

        [self dismissLoading];
        self.notebooksArray = notebooks;
    } failure:^(NSError *error) {

        [self dismissLoading];
        [self showError:error];
    }];
}

- (void)getNotesArrayFromNotebook:(ENNotebook *)notebook
                        sortOrder:(NSUInteger *)sortOrder   {

    [self showLoading];
    [[AppDependencies sharedInstance].notesUseCases getNotesFromNotebook:notebook
                                                               sortOrder:sortOrder
                                                                 success:^(NSArray *notes) {

                                                                     [self dismissLoading];
                                                                     self.notesArray = notes;
                                                                     [self.tableView reloadData];
                                                                 } failure:^(NSError *error) {

                                                                     [self dismissLoading];
                                                                     [self showError:error];
                                                                 }];
}

#pragma mark - NoteFilterProtocol

- (void)refreshNotes:(UITableViewController *)controller didFinishSettingFilter:(ENSessionSortOrder *)sortOrder	{

    [self getNotesArrayFromNotebook:self.notebooksArray[0] sortOrder:sortOrder];
}

#pragma mark - UITableVieDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.notesArray ? self.notesArray.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NoteTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteTVCell" forIndexPath:indexPath];
    
    [cell resetCell];
    [cell updateCellWith:self.notesArray[indexPath.row]];

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"Title: %@", [self.notesArray[indexPath.row] title]);
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"notesFilterSegue"]) {
        UINavigationController *nav = [segue destinationViewController];
        NotesFilterModalTVC *notesFilterTVC = (NotesFilterModalTVC *)nav.topViewController;
        notesFilterTVC.delegate = self;
    }
}


@end
