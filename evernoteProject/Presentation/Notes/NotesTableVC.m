//
//  NotesTableVC.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 25/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "NotesTableVC.h"
#import <evernote-cloud-sdk-ios/ENSDK.h>
#import <evernote-cloud-sdk-ios/ENSession.h>
#import <evernote-cloud-sdk-ios/EDAMNoteStore.h>
#import "Config.h"

@interface NotesTableVC ()

@property (nonatomic, strong) ENNoteSearch *noteSearch;
@property (nonatomic, strong) ENNotebook *notebook;
@property (nonatomic, strong) NSArray *notesArray;
@property (nonatomic, strong) NSArray *notebookArray;

@end

@implementation NotesTableVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self configView];
}

- (void)configView  {

    self.navigationItem.title = NSLocalizedString(@"notes", @"notes");
    [self configNotesTV];
}

#pragma mark Private methods

- (void)configNotesTV  {

    self.notesArray = [self getNotesFromNotebook:[self.notebookArray objectAtIndex:0]];
}

- (NSArray *)getNotesFromNotebook:(ENNotebook *)notebook    {

    __block NSArray *notes = [[NSArray alloc] init];

    ENNoteSearch *noteSearch  = [[ENNoteSearch alloc] initWithSearchString:@""];
    [[ENSession sharedSession] findNotesWithSearch:noteSearch inNotebook:nil orScope:ENSessionSearchScopeAll sortOrder:ENSessionSortOrderTitle maxResults:0 completion:^(NSArray *findNotesResults, NSError *findNotesError) {

        if (!findNotesResults) {
            NSLog(@"findNotesError: %@", findNotesError);
        } else if (findNotesResults.count == 0) {
            [self showMessage:@"Notes not found"];
        } else {
            notes = findNotesResults;
            NSLog(@"notesArray:  %@", notes);
            [self.tableView reloadData];
        }
    }];

    return notes;
}

#pragma mark - UITableVieDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteTVCell" forIndexPath:indexPath];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
