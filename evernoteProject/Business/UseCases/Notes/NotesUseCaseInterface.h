//
//  NotesUseCaseInterface.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 21/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "UseCasesBaseInterface.h"
#import <evernote-cloud-sdk-ios/ENSDK.h>

@protocol NotesUseCaseInterface <UseCasesBaseInterface>

- (void)getNotebooksWithSuccess:(void (^)(NSArray *))success
                        failure:(void (^)(NSError *))failure;

- (void)getNotesFromNotebook:(ENNotebook *)notebook
                   sortOrder:(ENSessionSortOrder *)sortOrder
                     success:(void (^)(NSArray *))success
                     failure:(void (^)(NSError *))failure;

- (void)createNote:(ENNote *)note
           success:(void (^)(ENNoteRef *))success
           failure:(void (^)(NSError *))failure;

- (void)getNoteByNoteRef:(ENNoteRef *)noteRef
                 success:(void (^)(ENNote *))success
                 failure:(void (^)(NSError *))failure;

@end
