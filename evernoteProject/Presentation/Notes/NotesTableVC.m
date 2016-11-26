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
#import "AppDependencies.h"
#import "NoteTVCell.h"
#import "Config.h"

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
}

- (void)configView  {

    self.navigationItem.title = NSLocalizedString(@"notes", @"notes");
    [self configNotesTV];
}

#pragma mark Private methods

- (void)configNotesTV  {

    [self getNotebooksArray];
    [self getNotesArrayFromNotebook:self.notebooksArray[0]];
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

- (void)getNotesArrayFromNotebook:(ENNotebook *)notebook {

    [self showLoading];
    [[AppDependencies sharedInstance].notesUseCases getNotesFromNotebook:notebook success:^(NSArray *notes) {
        [self dismissLoading];
        self.notesArray = notes;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [self dismissLoading];
        [self showError:error];
    }];
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
    [cell updateCellWith:self.notesArray[indexPath.row]];

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
