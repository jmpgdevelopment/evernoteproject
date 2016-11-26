//
//  NotesUseCase.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 21/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "NotesUseCase.h"
#import "UseCasesBaseInterface.h"

@implementation NotesUseCase

- (void)getNotebooksWithSuccess:(void (^)(NSArray *))success
                        failure:(void (^)(NSError *))failure   {

    [[ENSession sharedSession] listNotebooksWithCompletion:^(NSArray *notebooks, NSError *listNotebooksError) {

        if (notebooks) {
            NSLog(@"\n NotesUseCases - notebooks: %@", notebooks);
            success(notebooks);
        } else {
            NSLog(@"\n NotesUseCases - notebooksError: %@", listNotebooksError);
            failure(listNotebooksError);
        }
    }];
}

- (void)getNotesFromNotebook:(ENNotebook *)notebook
                          success:(void (^)(NSArray *))success
                          failure:(void (^)(NSError *))failure  {

    ENNoteSearch *noteSearch  = [[ENNoteSearch alloc] initWithSearchString:@""];
    [[ENSession sharedSession] findNotesWithSearch:noteSearch
                                        inNotebook:nil
                                           orScope:ENSessionSearchScopeAll
                                         sortOrder:ENSessionSortOrderTitle
                                        maxResults:0
                                        completion:^(NSArray *findNotesResults, NSError *findNotesError) {

                                            if (findNotesResults) {
                                                NSLog(@"\n NotesUseCases - notes: %@", findNotesResults);
                                                success(findNotesResults);
                                            } else {
                                                NSLog(@"\n NotesUseCases - notesError: %@", findNotesError);
                                                failure(findNotesError);
                                            }
    }];
}

- (void)createNote:(ENNote *)note
           success:(void (^)(ENNoteRef *))success
           failure:(void (^)(NSError *))failure  {

    [[ENSession sharedSession] uploadNote:note
                                 notebook:nil
                               completion:^(ENNoteRef *noteRef, NSError *uploadNoteError) {

                                   if (noteRef) {
                                       NSLog(@"\n NotesUseCases - noteRef: %@", noteRef);
                                       success(noteRef);
                                   } else {
                                       NSLog(@"\n NotesUseCases - uploadNoteError: %@", uploadNoteError);
                                       failure(uploadNoteError);
                                   }
    }];
}




@end
