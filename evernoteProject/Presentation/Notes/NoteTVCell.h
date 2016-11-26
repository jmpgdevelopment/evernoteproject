//
//  NoteTVCell.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 25/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <evernote-cloud-sdk-ios/ENSDK.h>
#import <evernote-cloud-sdk-ios/ENSession.h>

@interface NoteTVCell : UITableViewCell

- (void)updateCellWith:(ENNote *)note;

@end
