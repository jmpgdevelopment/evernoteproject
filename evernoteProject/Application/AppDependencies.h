//
//  AppDependencies.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 26/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesUseCaseInterface.h"

@interface AppDependencies : NSObject

@property (nonatomic, strong, readonly) id<NotesUseCaseInterface> notesUseCases;

+ (instancetype)sharedInstance;

@end
