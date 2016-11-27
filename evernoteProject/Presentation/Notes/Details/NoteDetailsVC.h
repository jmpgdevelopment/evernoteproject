//
//  NoteDetailsVC.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 27/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "BaseVC.h"
#import <evernote-cloud-sdk-ios/ENSession.H>

@interface NoteDetailsVC : BaseVC

@property (nonatomic, strong) ENNote *note;

@end
