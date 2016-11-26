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

@interface NotesFilterModalTVC ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *okButton;
@property (nonatomic, strong) NSArray *filterLabelsArray;
@property (nonatomic, strong) NSArray *filterSwitchArray;

@end

@implementation NotesFilterModalTVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self configView];
}

- (void)configView	{

    self.navigationItem.title = NSLocalizedString(@"notesFilter", @"notesFilter");
    [self showLoading];
    [self getFilterOptions];
}

- (void)getFilterOptions    {

    self.filterLabelsArray = @[@"Order by title", @"Order By Creation", @"Order By Modified"];
    self.filterSwitchArray = @[@1, @0, @0];
    [self.tableView reloadData];
    [self dismissLoading];
}

- (IBAction)okAction:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 NotesTableVC *notesTVC = [[NotesTableVC alloc] init];
                                 [notesTVC.tableView reloadData];
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
    noteFilter.filterActivedSwitch = self.filterSwitchArray[indexPath.row];
    [cell updateCellWith:noteFilter];

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
