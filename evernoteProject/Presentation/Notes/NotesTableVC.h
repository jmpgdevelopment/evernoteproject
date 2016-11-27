//
//  NotesTableVC.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 25/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <evernote-cloud-sdk-ios/ENSession.h>
#import "BaseTableVC.h"
#import "NotesFilterModalTVC.h"
#import "AddNoteVC.h"

@interface NotesTableVC : BaseTableVC <NotesFilterProtocol, AddNoteVCProtocol, UISearchBarDelegate>

@property (nonatomic) ENSessionSortOrder *sortOrder;

@end
