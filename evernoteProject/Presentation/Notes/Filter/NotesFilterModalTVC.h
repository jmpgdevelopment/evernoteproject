//
//  NotesFilterModalTVC.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 26/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableVC.h"
#import <evernote-cloud-sdk-ios/ENSession.h>

@protocol NotesFilterProtocol <NSObject>

- (void)refreshNotes:(UITableViewController *)controller didFinishSettingFilter:(ENSessionSortOrder *)sortOrder;

@end

@interface NotesFilterModalTVC : BaseTableVC

@property (nonatomic, weak) id <NotesFilterProtocol> delegate;

@end
