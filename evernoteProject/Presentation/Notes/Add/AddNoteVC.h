//
//  AddNoteVC.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 27/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "BaseVC.h"
#import <evernote-cloud-sdk-ios/ENSession.h>

@protocol AddNoteVCProtocol <NSObject>

- (void)refreshNotes:(UITableViewController *)controller didFinishAddingNote:(ENSessionSortOrder *)sortOrder;

@end

@interface AddNoteVC : BaseVC <ENSaveToEvernoteActivityDelegate>

@property (nonatomic, weak) id <AddNoteVCProtocol> delegate;

@end
