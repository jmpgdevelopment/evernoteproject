//
//  NotesFilterModalTVC.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 26/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "NotesFilterModalTVC.h"
#import "NoteFilterTVCell.h"
#import "NoteFilter.h"
#import "NotesTableVC.h"
#import "NoteFilterTVCell.h"

@interface NotesFilterModalTVC ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *okButton;

@property (nonatomic, strong) NSArray *filterLabelsArray;
@property (nonatomic) ENSessionSortOrder *sortOrder;

@end

@implementation NotesFilterModalTVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self configView];
}

- (void)configView	{

    self.navigationItem.title = NSLocalizedString(@"notesFilter", @"notesFilter");
    [self getFilterOptions];
}

- (void)getFilterOptions    {

    self.filterLabelsArray = @[NSLocalizedString(@"orderByTitle", @"orderByTitle"),
                               NSLocalizedString(@"orderByCreationDate", @"orderByCreationDate"),
                               NSLocalizedString(@"orderByModificationDate", @"orderByModificationDate")];
    [self.tableView reloadData];
}

#pragma mark - UI Actions

- (IBAction)okAction:(id)sender {

    [self dismissViewControllerAnimated:YES completion:^{

        UIStoryboard *notesStoryboard = [UIStoryboard storyboardWithName:@"notes" bundle:nil];
        NotesTableVC *noteTableVC = [notesStoryboard instantiateViewControllerWithIdentifier:@"notesTableVC"];
        [self.delegate refreshNotes:noteTableVC didFinishSettingFilter:self.sortOrder];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.filterLabelsArray ? self.filterLabelsArray.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NoteFilterTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteFilterTVCell" forIndexPath:indexPath];
    NoteFilter *noteFilter = [[NoteFilter alloc] init];
    noteFilter.optionLabel = self.filterLabelsArray[indexPath.row];

    [cell updateCellWith:noteFilter];

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"Title: %@", self.filterLabelsArray[indexPath.row]);
    switch (indexPath.row) {
        case 0:
            self.sortOrder = (NSUInteger *)ENSessionSortOrderTitle;
            break;
        case 1:
            self.sortOrder = (NSUInteger *)ENSessionSortOrderRecentlyCreated;
            break;
        case 2:
            self.sortOrder = (NSUInteger *)ENSessionSortOrderRecentlyUpdated;
            break;
    }
}

@end
