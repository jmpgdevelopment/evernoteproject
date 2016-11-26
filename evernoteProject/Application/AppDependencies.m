//
//  AppDependencies.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 26/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "AppDependencies.h"
#import "NotesUseCase.h"

@implementation AppDependencies

+ (instancetype)sharedInstance  {

    static AppDependencies *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppDependencies alloc] init];
    });

    return sharedInstance;
}

#pragma mark - NSObject

- (instancetype)init    {

    if (self = [super init]) {
        [self initBusinessLayer];
    }

    return self;
}

#pragma mark - Private methods

- (void)initBusinessLayer   {

    _notesUseCases = [[NotesUseCase alloc] init];
}

@end
